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

import 'dart:async';

import 'package:flutter/material.dart';

/// GeneralLibraryFlutter
typedef AnyObjectAutoKeepStateDataReturnData<T> = ({
  /// GeneralLibraryFlutter
  T data,

  /// GeneralLibraryFlutter
  bool isRefresh,
});

/// GeneralLibraryFlutter
typedef AnyObjectAutoKeepStateDataOnGetDataReFresh<T>
    = FutureOr<AnyObjectAutoKeepStateDataReturnData<T>> Function(
  /// GeneralLibraryFlutter
  AnyObjectAutoKeepStateData<T> anyObjectAutoKeepStateData,
);

/// auto save data to memory ram
///
/// example:
///
/// ```dart
/// AnyObjectAutoKeepStateData<List<String>>(
///   data: [],
///   duration_expire: const Duration(minutes: 10),
///   onGetDataReFresh: (anyObjectAutoKeepStateData) async {
///     if (anyObjectAutoKeepStateData.date_time_expire.isExpired() || anyObjectAutoKeepStateData.data.isEmpty) {
///       return (
///         data: List.generate(100, (index) {
///           return "${index}";
///         }).toList(),
///         isRefresh: true,
///       );
///     }
///     return (data: <String>[], isRefresh: false);
///   },
/// );
/// ```
///
/// example full usage
///
///
class AnyObjectAutoKeepStateData<T> extends ChangeNotifier {
  /// GeneralLibraryFlutter
  T data;

  /// GeneralLibraryFlutter
  DateTime date_time_expire = DateTime.now();

  /// GeneralLibraryFlutter
  Duration duration_expire;

  /// GeneralLibraryFlutter
  bool is_no_expire;

  /// GeneralLibraryFlutter
  AnyObjectAutoKeepStateDataOnGetDataReFresh<T>? onGetDataReFresh;

  /// GeneralLibraryFlutter
  bool is_skip_auto_set_date_time_expire;

  /// GeneralLibraryFlutter
  bool is_pending_operation = false;

  /// GeneralLibraryFlutter
  AnyObjectAutoKeepStateData({
    /// GeneralLibraryFlutter
    required this.data,

    /// GeneralLibraryFlutter
    this.is_no_expire = false,

    /// GeneralLibraryFlutter
    this.onGetDataReFresh,

    /// GeneralLibraryFlutter
    required this.duration_expire,

    /// GeneralLibraryFlutter
    this.is_skip_auto_set_date_time_expire = false,
  });

  /// GeneralLibraryFlutter
  void update() {
    notifyListeners();
  }

  /// GeneralLibraryFlutter
  FutureOr<AnyObjectAutoKeepStateDataReturnData<T>> defaultOnGetDataRefresh(
    /// GeneralLibraryFlutter
    AnyObjectAutoKeepStateData<T> anyObjectAutoKeepStateData,
  ) async {
    return (data: data, isRefresh: false);
  }

  /// set isRefresh to true for auto save data and set date_time_expire
  FutureOr<T> getData() async {
    final AnyObjectAutoKeepStateDataOnGetDataReFresh<T> on_get_data_refresh =
        onGetDataReFresh ?? defaultOnGetDataRefresh;
    final AnyObjectAutoKeepStateDataReturnData<T> new_data =
        await on_get_data_refresh(this);
    if (new_data.isRefresh) {
      data = new_data.data;
      if (is_skip_auto_set_date_time_expire == false) {
        date_time_expire = DateTime.now().add(duration_expire);
      }
      update();
    }
    return new_data.data;
  }

  /// GeneralLibraryFlutter
  void reset({
    void Function(AnyObjectAutoKeepStateData<T> anyObjectAutoKeepStateData)?
        onReset,
  }) {
    DateTime dateTime = DateTime.now().subtract(const Duration(seconds: 10));
    date_time_expire = dateTime;
    final on_reset = onReset;
    if (on_reset != null) {
      on_reset(this);
    }
    update();
  }
}
