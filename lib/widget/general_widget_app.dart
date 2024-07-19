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
import 'package:flutter/services.dart';

class GeneralLibFlutterApp extends ChangeNotifier {
  GeneralLibFlutterApp();

  ThemeMode themeMode = ThemeMode.system;

  AlignmentGeometry switchInitialPosition = Alignment.center;
  AlignmentGeometry switchLastKnownPosition = Alignment.centerLeft;

  ThemeMode autoChangeThemeMode() {
    switch (switchInitialPosition) {
      case Alignment.centerLeft:
        switchInitialPosition = Alignment.center;
        switchLastKnownPosition = Alignment.centerLeft;
        break;
      case Alignment.center:
        if (switchLastKnownPosition == Alignment.centerLeft) {
          switchInitialPosition = Alignment.centerRight;
        } else {
          switchInitialPosition = Alignment.centerLeft;
        }
        break;
      case Alignment.centerRight:
        switchInitialPosition = Alignment.center;
        switchLastKnownPosition = Alignment.centerRight;
        break;
      default:
        switchInitialPosition = Alignment.center;
        switchInitialPosition = Alignment.centerLeft;
        break;
    }

    if (switchInitialPosition == Alignment.centerLeft) {
      themeMode = ThemeMode.dark;
    }

    if (switchInitialPosition == Alignment.center) {
      themeMode = ThemeMode.system;
    }
    if (switchInitialPosition == Alignment.centerRight) {
      themeMode = ThemeMode.light;
    }

    // if (themeMode == ThemeMode.system) {
    //   themeMode = ThemeMode.dark;
    // } else if (themeMode == ThemeMode.dark) {
    //   themeMode = ThemeMode.light;
    // } else if (themeMode == ThemeMode.light) {
    //   themeMode = ThemeMode.system;
    // }

    notifyListeners();
    return themeMode;
  }

  void autoChangeSystemUi({
    required ThemeMode theme_mode,
    required Brightness Function() onChangeBrightness,
  }) {
    if (theme_mode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      );
    } else if (theme_mode == ThemeMode.light) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    } else if (theme_mode == ThemeMode.system) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: (Brightness.dark == Brightness.light) ? Brightness.dark : Brightness.light,
          statusBarBrightness: (Brightness.dark == Brightness.light) ? Brightness.light : Brightness.dark,
        ),
      );
    }

    notifyListeners();
  }

  ThemeMode autoChangeTheme({required Brightness Function() onChangeBrightness}) {
    ThemeMode theme_mode = autoChangeThemeMode();
    autoChangeSystemUi(theme_mode: theme_mode, onChangeBrightness: onChangeBrightness);
    notifyListeners();
    return theme_mode;
  }
}

class GeneralLibFlutterAppMain extends StatelessWidget {
  final GeneralLibFlutterApp generalLibFlutterApp;
  final ThemeData Function(ThemeData defaultTheme)? lightTheme;
  final ThemeData Function(ThemeData defaultTheme)? darkTheme;
  final Widget? child;
  final Widget Function(ThemeMode themeMode, ThemeData lightTheme, ThemeData darkTheme, Widget? widget) builder;

  const GeneralLibFlutterAppMain({
    super.key,
    required this.generalLibFlutterApp,
    this.lightTheme,
    this.darkTheme,
    // required this.theme_notifier,
    required this.builder,
    this.child,
  });

  ThemeData lightTheme_default() {
    return ThemeData(
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      shadowColor: const Color.fromARGB(110, 0, 0, 0),
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      indicatorColor: Colors.black,
      dialogBackgroundColor: Colors.white,
      cardColor: Colors.grey,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.black,
        secondary: Colors.white,
      ),
      highlightColor: Colors.indigo,
    );
  }

  ThemeData darkTheme_default() {
    return ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      indicatorColor: Colors.white,
      dialogBackgroundColor: const Color.fromARGB(255, 64, 64, 64),
      cardColor: Colors.grey,
      shadowColor: const Color.fromARGB(255, 24, 4, 83),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color.fromARGB(255, 64, 64, 64),
      ),
      highlightColor: Colors.cyan
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: generalLibFlutterApp,
      builder: (context, child) {
        return builder(
          generalLibFlutterApp.themeMode,
          (lightTheme != null) ? lightTheme!(lightTheme_default()) : lightTheme_default(),
          (darkTheme != null) ? darkTheme!(darkTheme_default()) : darkTheme_default(),
          null,
        );
      },
    );
  }
}
