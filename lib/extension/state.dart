// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:general_lib_flutter/extension/build_context.dart';

/// tt
typedef OnHandleFunctionStateFullWidget<T> = FutureOr<dynamic> Function(
    BuildContext context, T statefulWidget);
///// UncompleteDocumentation
typedef OnHandleErrorStateFullWidget<T> = FutureOr<dynamic> Function(
    Object error, StackTrace stackTrace, T statefulWidget);
/// UncompleteDocumentation
extension GeneralLibFlutterStateExtension<T extends StatefulWidget>
    on State<T> {
      /// UncompleteDocumentation
  void setStateAsync(
    FutureOr<dynamic> Function() fn, {
    void Function(Object e, StackTrace stackTrace)? onError,
  }) async {
    try {
      await fn();

      if (mounted) {
        // ignore: invalid_use_of_protected_member
        setState(() {});
      }
    } catch (e, stack) {
      if (onError != null) {
        onError(e, stack);
      }
    }
  }
/// UncompleteDocumentation
  void setStateWithIgnoreError({
    required void Function() fn,
    void Function(Object e, StackTrace stackTrace)? onError,
  }) {
    try {
      if (mounted) {
        // ignore: invalid_use_of_protected_member
        setState(fn);
      }
    } catch (e, stack) {
      if (onError != null) {
        onError(e, stack);
      }
    }
  }/// UncompleteDocumentation

  void handleFunction({
    required OnHandleFunctionStateFullWidget<T> onFunction,
    OnHandleErrorStateFullWidget<T>? onError,
  }) {
    Future(() async {
      try {
        await onFunction(context, widget);
      } catch (error, stack) {
        OnHandleErrorStateFullWidget<T>? eFunction = onError;
        if (eFunction != null) {
          await eFunction(error, stack, widget);
        } else {
          rethrow;
        }
      }
    });
  }
/// UncompleteDocumentation
  Orientation extension_general_lib_flutter_orientation() {
    return context.orientation;
  }
}
/// UncompleteDocumentation
typedef HandleFunctionGeneralLibFlutter<T extends StatefulWidget> = void
    Function({
  required OnHandleFunctionStateFullWidget<T> onFunction,
  OnHandleErrorStateFullWidget<T>? onError,
});
/// UncompleteDocumentation
extension StateGeneralLibFlutterGeneralLibFlutterStatelessWidgetExtension<
    T extends StatelessWidget> on T {
      /// UncompleteDocumentation
  Orientation extension_general_lib_flutter_orientation({
    required BuildContext context,
  }) {
    return context.orientation;
  }
}
