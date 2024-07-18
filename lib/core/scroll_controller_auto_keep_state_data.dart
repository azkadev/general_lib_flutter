// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/scroll_controller.dart';

class ScrollControllerAutoKeepStateData extends ChangeNotifier {
  bool is_activate = false;
  double last_offset = 0;
  bool is_call_activate = false;
  late final PageStorageKey page_storage_key;
  final PageStorageBucket page_storage_bucket = PageStorageBucket();
  void Function() on_initialized = () {};
  void Function(bool isAttach, double offset) on_attach_or_detach = (bool isAttach, double offset) {};

  late ScrollController scroll_controller = ScrollController(
    keepScrollOffset: true,
    onAttach: (position) {
      if (is_call_activate == false) {
        is_call_activate = true;
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

  void update() {
    notifyListeners();
  }

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

  Widget build({
    required Widget child,
  }) {
    return PageStorage(
      key: page_storage_key,
      bucket: page_storage_bucket,
      child: child,
    );
  }
}
