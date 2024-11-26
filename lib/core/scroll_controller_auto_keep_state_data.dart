// ignore_for_file: empty_catches

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
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
  late final ScrollController scroll_controller = ScrollController(
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

    valueNotifierIsScrolling.dispose();

    super.dispose();
  }

  /// notify all listener
  void update() {
    notifyListeners();
  }

  final ValueNotifier<bool> valueNotifierIsScrolling = ValueNotifier(false);

  /// listen scroll
  void onScrolling({
    required bool Function() onMounted,
    required void Function(bool isScrolling, double offset) callback,
  }) {
    scroll_controller.onScrolling((isScrolling) {
      bool is_mounted = onMounted();
      if (is_mounted && is_activate) {
        valueNotifierIsScrolling.value = isScrolling;
        callback(isScrolling, scroll_controller.offset);
      }
    });
  }

  bool isAtEdge() {
    try {
      return scroll_controller.position.atEdge;
    } catch (e) {}
    return false;
  }

  Alignment alignment() {
    if (isAtEdge()) {
      try {
        if (scroll_controller.position.pixels == scroll_controller.position.minScrollExtent) {
          return Alignment.topCenter;
        } else if (scroll_controller.position.pixels == scroll_controller.position.maxScrollExtent) {
          return Alignment.bottomCenter;
        }
      } catch (e) {}
    }
    return Alignment.center;
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
