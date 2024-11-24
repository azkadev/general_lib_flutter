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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
      PointerDeviceKind.trackpad,
      PointerDeviceKind.stylus,
      PointerDeviceKind.invertedStylus,
    };
  }
}

class GeneralLibFlutter {
  const GeneralLibFlutter();
  static void ensureInitialized() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static BorderRadius borderRadiusBubbleChatMessage({
    required bool isOutGoing,
    double borderMax = 15,
    required int index,
    required int totalCount,
  }) {
    bool isFirstIndex = index == 0;
    bool isLastIndex = index == totalCount - 1;
    // detek first
    if (isFirstIndex) {
      if (isOutGoing) {
        return BorderRadius.only(
          topLeft: Radius.circular(borderMax),
          bottomLeft: Radius.circular(borderMax),
          bottomRight: Radius.circular(borderMax),
        );
      } else {
        return BorderRadius.only(
          topRight: Radius.circular(borderMax),
          bottomLeft: Radius.circular(borderMax),
          bottomRight: Radius.circular(borderMax),
        );
      }
    } else if (isLastIndex) {
      if (isOutGoing) {
        return BorderRadius.only(
          topRight: Radius.circular(borderMax),
          bottomLeft: Radius.circular(borderMax),
          topLeft: Radius.circular(borderMax),
        );
      } else {
        return BorderRadius.only(
          topRight: Radius.circular(borderMax),
          topLeft: Radius.circular(borderMax),
          bottomRight: Radius.circular(borderMax),
        );
      }
    }

    return BorderRadius.circular(borderMax);
  }
}

void assertAsync({
  required FutureOr<dynamic> Function() function,
}) {
  assert(() {
    Future(function);
    return true;
  }());
}

void assertSync({
  required dynamic Function() function,
}) {
  assert(() {
    function();
    return true;
  }());
}

mixin GeneralLibFlutterStatefulWidget<T extends StatefulWidget> on State<T> {
  final GlobalKey appBarGlobalKey = GlobalKey();
  final GlobalKey bottomBarGlobalKey = GlobalKey();
  final GlobalKey floatingBarGlobalKey = GlobalKey();

  bool isCanPop = false;
  bool _isEnsureInitialized = false;
  void ensureInitialized() {
    if (_isEnsureInitialized) {
      return;
    }
    isCanPop = context.navigator().canPop();
    _isEnsureInitialized = true;
  }

  bool isLoading = false;

  Future<void> refresh();
}
