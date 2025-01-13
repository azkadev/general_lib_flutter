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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// UncompleteDocumentation
extension PageStorageBucketGeneralLibFlutterExtension on PageStorageBucket {
  /// UncompleteDocumentation
  T readStateData<T>({
    required BuildContext context,
    required String key,
    required T Function(BuildContext context, String key) onNotFound,
  }) {
    try {
      return readState(context, identifier: key) as T;
    } catch (e) {
      return onNotFound(context, key);
    }
  }

  /// UncompleteDocumentation

  T? readStateDataOrNull<T>({
    required BuildContext context,
    required String key,
  }) {
    try {
      return readState(context, identifier: key) as T;
    } catch (e) {
      return null;
    }
  }

  /// UncompleteDocumentation
  void writeStateData<T>({
    required BuildContext context,
    required String key,
    required T value,
  }) {
    writeState(context, value, identifier: key);
  }

  /// UncompleteDocumentation
  void removes({
    required BuildContext context,
    required List<String> keys,
  }) {
    for (String key in keys) {
      if (key.trim().isEmpty) {
        continue;
      }
      remove(context: context, key: key.trim());
    }
  }

  /// UncompleteDocumentation
  void remove({
    required BuildContext context,
    required String key,
  }) {
    writeState(context, null, identifier: key);
  }
}
