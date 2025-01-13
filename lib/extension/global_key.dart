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
// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';

/// UncompleteDocumentation
extension GlobalKeyGeneralLibFlutterExtension on GlobalKey {
  /// UncompleteDocumentation
  Future<void> animateScroll({
    double alignment = 0.0,
    Duration? duration,
    Curve curve = Curves.ease,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) async {
    return await currentContext!.animateScroll(
      alignment: alignment,
      duration: duration,
      curve: curve,
      alignmentPolicy: alignmentPolicy,
    );
  }

  /// UncompleteDocumentation

  Offset? toOffset({
    void Function(Object error, StackTrace stackTrace)? onError,
  }) {
    try {
      final renderBox = currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return null;
      Offset offset = renderBox
          .localToGlobal(Offset.zero)
          .translate(renderBox.size.width / 2, renderBox.size.height / 2);
      return offset;
    } catch (e, stack) {
      if (onError != null) {
        onError(e, stack);
      }
      return null;
    }
  }

  /// UncompleteDocumentation

  Future<Uint8List?> toImagePng({
    double pixelRatio = 1.0,
    FutureOr<void> Function(Object error, StackTrace stackTrace)? onError,
  }) async {
    try {
      return await currentContext!.toImagePng(
        pixelRatio: pixelRatio,
        onError: onError,
      );
    } catch (e, stack) {
      if (onError != null) {
        await onError(e, stack);
      }
      return null;
    }
  }

  /// UncompleteDocumentation
  Size sizeRenderBox() {
    try {
      return (currentContext!).sizeRenderBox();
    } catch (e) {}
    return Size.zero;
  }

  /// UncompleteDocumentation
  Size? sizeRenderBoxOrNull() {
    try {
      Size size = sizeRenderBox();
      if (size.isEmpty) {
        return null;
      }
      return size;
    } catch (e) {}
    return null;
  }

  /// UncompleteDocumentation

  skoak() {}
}
