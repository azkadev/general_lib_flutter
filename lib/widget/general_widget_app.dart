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
import 'package:general_lib_flutter/extension/build_context.dart';

class GeneralLibFlutterApp extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  AlignmentGeometry switchInitialPosition = Alignment.center;
  AlignmentGeometry switchLastKnownPosition = Alignment.centerLeft;
  bool is_has_set_theme_status_bar_first = false;
  GeneralLibFlutterApp();

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
      Brightness brightness = onChangeBrightness();
      // brightness ;
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: (brightness == Brightness.light) ? Brightness.dark : Brightness.light,
          statusBarBrightness: (brightness == Brightness.light) ? Brightness.light : Brightness.dark,
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

  void initState({
    required BuildContext context,
    required ThemeMode themeMode,
    required void Function() onSet,
  }) {
    if (is_has_set_theme_status_bar_first == false) {
      is_has_set_theme_status_bar_first = true;
      autoChangeSystemUi(
        theme_mode: themeMode,
        onChangeBrightness: () {
          return context.mediaQueryData.platformBrightness;
        },
      );

      onSet();
    }
  }
}

class GeneralLibFlutterAppMain extends StatelessWidget {
  final GeneralLibFlutterApp generalLibFlutterApp;
  final ThemeData Function(BuildContext context, ThemeData defaultTheme)? lightTheme;
  final ThemeData Function(BuildContext context, ThemeData defaultTheme)? darkTheme;
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
    final ThemeData themeData = ThemeData.light();
    return themeData.copyWith(
      primaryColor: themeData.scaffoldBackgroundColor,
      shadowColor: const Color.fromARGB(255, 0, 0, 0).withAlpha(110),
      textTheme: Typography().black.apply(fontFamily: "Poppins", package: "general_lib_assets_flutter"),
      indicatorColor: Colors.black,
      dialogBackgroundColor: Colors.white,
      cardColor: Colors.grey,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.black,
        secondary: Colors.white,
      ),
      highlightColor: Colors.indigo,
      textSelectionTheme: themeData.textSelectionTheme.copyWith(
        cursorColor: Colors.black,
        selectionColor: Colors.black.withOpacity(0.4),
      ),
    );
  }

  ThemeData darkTheme_default() {
    final ThemeData themeData = ThemeData.dark();
    return themeData.copyWith(
      primaryColor: const Color.fromARGB(255, 30, 30, 30),
      shadowColor: const Color.fromARGB(255, 255, 255, 255).withAlpha(110),
      scaffoldBackgroundColor: Colors.black,
      textTheme: Typography().white.apply(fontFamily: "Poppins", package: "general_lib_assets_flutter"),
      indicatorColor: Colors.white,
      dialogBackgroundColor: const Color.fromARGB(255, 64, 64, 64),
      cardColor: Colors.grey,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color.fromARGB(255, 64, 64, 64),
      ),
      highlightColor: Colors.cyan,
      textSelectionTheme: themeData.textSelectionTheme.copyWith(
        cursorColor: Colors.white,
        selectionColor: Colors.white.withOpacity(0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: generalLibFlutterApp,
      child: child,
      builder: (context, child) {
        return builder(
          generalLibFlutterApp.themeMode,
          (lightTheme != null) ? lightTheme!(context, lightTheme_default()) : lightTheme_default(),
          (darkTheme != null) ? darkTheme!(context, darkTheme_default()) : darkTheme_default(),
          child,
        );
      },
    );
  }
}
