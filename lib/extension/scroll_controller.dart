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
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ScrollControllerExtension on ScrollController {
  void onScrolling(void Function(bool isScrolling) callback) {
    position.onScrolling(callback);
  }

  Future<bool> scrollToGlobalKey({
    required GlobalKey globalKey,
    double alignment = 0.0,
    Duration duration = Durations.short4,
    Curve curve = Curves.easeOut,
    ScrollPositionAlignmentPolicy alignmentPolicy = ScrollPositionAlignmentPolicy.explicit,
  }) async {
    final BuildContext? context = globalKey.currentContext;
    if (context == null) {
      return false;
    }
    await Scrollable.ensureVisible(
      context,
      alignment: alignment,
      duration: duration,
      curve: curve,
      alignmentPolicy: alignmentPolicy,
    );
    return true;
  }

  Future<void> scrollToMinimum({
    
    Duration duration = Durations.short4,
    Curve curve = Curves.easeOut,
  }) async {
    await animateTo(
      position.maxScrollExtent,
      duration: duration,
      curve: curve,
    );
  }
  Future<void> scrollToMaximum({ 
    Duration duration = Durations.short4,
    Curve curve = Curves.easeOut,
  }) async {
    await animateTo(
      position.minScrollExtent,
      duration: duration,
      curve: curve,
    );
  }

}

extension ScrollPositionExtension on ScrollPosition {
  void onScrolling(void Function(bool isScrolling) callback) {
    isScrollingNotifier.addListener(() {
      callback(isScrollingNotifier.value);
    });
  }
}
