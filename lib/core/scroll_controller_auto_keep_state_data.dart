// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/scroll_controller.dart';

/// Auto Keep Scroll Controller
class ScrollControllerAutoKeepStateData extends ChangeNotifier {
  /// bool is_active or attach or scroll listener
  bool is_activate = false;

  ///
  double last_offset = 0;

  /// if done call function initialized set to true
  bool _is_call_activate = false;

  /// page_store_key for auto save offset scroll
  late final PageStorageKey page_storage_key;

  /// page storage bucket for keep data scrolll
  final PageStorageBucket page_storage_bucket = PageStorageBucket();

  /// call only one
  void Function() on_initialized = () {};

  /// listen attach or detach
  void Function(bool isAttach, double offset) on_attach_or_detach = (bool isAttach, double offset) {};

  /// scroll_controller
  late ScrollController scroll_controller = ScrollController(
    keepScrollOffset: true,
    onAttach: (position) {
      if (_is_call_activate == false) {
        _is_call_activate = true;
        on_initialized();
      }
      on_attach_or_detach(true, position.pixels);
      is_activate = true;
      update();
    },
    onDetach: (position) {
      is_activate = false;
      on_attach_or_detach(is_activate, position.pixels);
      last_offset = position.pixels;
      update();
    },
  );

  /// safe offset scroll automatic without any hastle
  ScrollControllerAutoKeepStateData({
    required String keyId,
  }) {
    page_storage_key = PageStorageKey(keyId);
  }

  @override
  void dispose() {
    scroll_controller.dispose();
    super.dispose();
  }

  /// notify all listener
  void update() {
    notifyListeners();
  }

  /// listen scroll
  void onScrolling({
    required bool Function() onMounted,
    required void Function(bool isScrolling, double offset) callback,
  }) {
    scroll_controller.onScrolling((isScrolling) {
      bool is_mounted = onMounted();
      if (is_mounted && is_activate) {
        callback(isScrolling, scroll_controller.offset);
      }
    });
  }

  /// wrap page for auto set
  Widget build({
    required Widget child,
  }) {
    return PageStorage(
      key: page_storage_key,
      bucket: page_storage_bucket,
      child: child,
    );
  }

  /// wrap page for auto set
  Widget builderWidget({
    required Widget Function(BuildContext context, PageStorageBucket pageStorageBucket) builder,
  }) {
  
    return PageStorage(
      key: page_storage_key,
      bucket: page_storage_bucket,
      child: Builder(
        builder: (context) {
          return builder(context, page_storage_bucket);
        },
      ),
    );
  }
}
