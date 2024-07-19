// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';

typedef AnyObjectAutoKeepStateDataReturnData<T> = ({
  T data,
  bool isRefresh,
});

typedef AnyObjectAutoKeepStateDataOnGetDataReFresh<T> = FutureOr<AnyObjectAutoKeepStateDataReturnData<T>> Function(AnyObjectAutoKeepStateData<T> anyObjectAutoKeepStateData);

class AnyObjectAutoKeepStateData<T> extends ChangeNotifier {
  T data;
  DateTime date_time_expire = DateTime.now();
  Duration duration_expire;
  bool is_no_expire;
  AnyObjectAutoKeepStateDataOnGetDataReFresh<T>? onGetDataReFresh;
  bool is_skip_auto_set_date_time_expire;
  bool is_pending_operation = false;
  AnyObjectAutoKeepStateData({
    required this.data,
    this.is_no_expire = false,
    this.onGetDataReFresh,
    required this.duration_expire,
    this.is_skip_auto_set_date_time_expire = false,
  });

  void update() {
    notifyListeners();
  }

  FutureOr<AnyObjectAutoKeepStateDataReturnData<T>> defaultOnGetDataRefresh(AnyObjectAutoKeepStateData<T> anyObjectAutoKeepStateData) async {
    return (data: data, isRefresh: false);
  }

  FutureOr<T> getData() async {
    final AnyObjectAutoKeepStateDataOnGetDataReFresh<T> on_get_data_refresh = onGetDataReFresh ?? defaultOnGetDataRefresh;
    final AnyObjectAutoKeepStateDataReturnData<T> new_data = await on_get_data_refresh(this);
    if (new_data.isRefresh) {
      data = new_data.data;
      if (is_skip_auto_set_date_time_expire == false) {
        date_time_expire = DateTime.now().add(duration_expire);
      }
      update();
    }
    return new_data.data;
  }

  void reset({
    void Function(AnyObjectAutoKeepStateData<T> anyObjectAutoKeepStateData)? onReset,
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
