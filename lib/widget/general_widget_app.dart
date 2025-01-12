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

/// GeneralLibraryFlutter
class GeneralLibFlutterApp extends ChangeNotifier {
  /// GeneralLibraryFlutter
  ThemeMode themeMode = ThemeMode.system;

  /// GeneralLibraryFlutter
  AlignmentGeometry switchInitialPosition = Alignment.center;

  /// GeneralLibraryFlutter
  AlignmentGeometry switchLastKnownPosition = Alignment.centerLeft;

  /// GeneralLibraryFlutter
  bool is_has_set_theme_status_bar_first = false;

  /// GeneralLibraryFlutter
  GeneralLibFlutterApp();

  /// GeneralLibraryFlutter
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

  /// GeneralLibraryFlutter
  void autoChangeSystemUi({
    /// GeneralLibraryFlutter
    required ThemeMode theme_mode,

    /// GeneralLibraryFlutter
    required Brightness Function() onChangeBrightness,
  }) {
    setSystemUIOverlayStyle(
      theme_mode: theme_mode,
      onChangeBrightness: onChangeBrightness,
    );

    notifyListeners();
  }

  /// GeneralLibraryFlutter
  void setSystemUIOverlayStyle({
    /// GeneralLibraryFlutter
    required ThemeMode theme_mode,

    /// GeneralLibraryFlutter
    required Brightness Function() onChangeBrightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      getSystemUiOverlayStyle(
        themeMode: theme_mode,
        onChangeBrightness: onChangeBrightness,
      ),
    );
  }

  /// GeneralLibraryFlutter
  SystemUiOverlayStyle getSystemUiOverlayStyle({
    /// GeneralLibraryFlutter
    required ThemeMode themeMode,

    /// GeneralLibraryFlutter
    required Brightness Function() onChangeBrightness,
  }) {
    if (themeMode == ThemeMode.dark) {
      return const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      );
    } else if (themeMode == ThemeMode.light) {
      return const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
    } else {
      final Brightness brightness = onChangeBrightness();
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: (brightness == Brightness.light)
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: (brightness == Brightness.light)
            ? Brightness.light
            : Brightness.dark,
      );
    }
  }

  /// GeneralLibraryFlutter
  ThemeMode autoChangeTheme({
    /// GeneralLibraryFlutter
    required Brightness Function() onChangeBrightness,
  }) {
    final ThemeMode theme_mode = autoChangeThemeMode();
    autoChangeSystemUi(
        theme_mode: theme_mode, onChangeBrightness: onChangeBrightness);
    notifyListeners();
    return theme_mode;
  }

  /// GeneralLibraryFlutter
  void initState({
    /// GeneralLibraryFlutter
    required BuildContext context,

    /// GeneralLibraryFlutter
    required ThemeMode themeMode,

    /// GeneralLibraryFlutter
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

  /// GeneralLibraryFlutter
  void update() {
    notifyListeners();
  }

  /// GeneralLibraryFlutter
  static ThemeData lightTheme_default() {
    final ThemeData themeData = ThemeData.light();
    const colorScheme = ColorScheme.light();

    final textTheme = Typography().black;
    return themeData.copyWith(
      primaryColor: const Color.fromARGB(255, 214, 216, 223),

      /// from vs code tokyo night light theme
      shadowColor: const Color.fromARGB(255, 0, 0, 0).withAlpha(110),
      textTheme: textTheme
          .apply(
            fontFamily: "Poppins",
            package: "general_lib_assets_flutter",
          )
          .copyWith(
            bodySmall: (textTheme.bodySmall ??
                    themeData.textTheme.bodySmall ??
                    const TextStyle())
                .copyWith(
              color: Colors.black,
            ),
          ),
      indicatorColor: Colors.black,
      dialogBackgroundColor: Colors.white,
      cardColor: Colors.grey,
      appBarTheme: themeData.appBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(
            255, 214, 216, 223), // old themeData.scaffoldBackgroundColor,
        surfaceTintColor: const Color.fromARGB(
            255, 214, 216, 223), // old themeData.scaffoldBackgroundColor,
      ),
      colorScheme: colorScheme.copyWith(
        primary: Colors.black,
        secondary: Colors.white,
        surface: const Color.fromARGB(255, 230, 231, 237),

        /// from vs code tokyo night light theme
      ),
      highlightColor: Colors.indigo,
      textSelectionTheme: themeData.textSelectionTheme.copyWith(
        cursorColor: Colors.black,
        selectionColor: Colors.black.withValues(
          alpha: 0.4,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 230, 231, 237),
    );
  }

  /// GeneralLibraryFlutter
  static ThemeData darkTheme_default() {
    final ThemeData themeData = ThemeData.dark();
    const colorScheme = ColorScheme.dark();

    final textTheme = Typography().white;
    // const Color.fromARGB(255, 228, 219, 219);
    return themeData.copyWith(
      primaryColor: const Color.fromARGB(255, 22, 22, 30),

      /// from vs code tokyo night theme
      shadowColor: const Color.fromARGB(255, 255, 255, 255).withAlpha(110),
      scaffoldBackgroundColor:
          const Color.fromARGB(255, 26, 27, 38), // old Colors.black,

      textTheme: textTheme
          .apply(fontFamily: "Poppins", package: "general_lib_assets_flutter")
          .copyWith(
              bodySmall: (textTheme.bodySmall ??
                      themeData.textTheme.bodySmall ??
                      const TextStyle())
                  .copyWith(color: Colors.white)),
      indicatorColor: Colors.white,
      dialogBackgroundColor: const Color.fromARGB(255, 64, 64, 64),
      cardColor: Colors.grey,
      appBarTheme: themeData.appBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(
            255, 22, 22, 30), // old themeData.scaffoldBackgroundColor,
        surfaceTintColor: const Color.fromARGB(
            255, 22, 22, 30), // old themeData.scaffoldBackgroundColor,
      ),
      colorScheme: colorScheme.copyWith(
        primary: Colors.white, // old const Color.fromARGB(255, 64, 64, 64),
        surface: const Color.fromARGB(255, 26, 27, 38),

        /// from vs code tokyo night theme
      ),
      highlightColor: Colors.cyan,
      textSelectionTheme: themeData.textSelectionTheme.copyWith(
        cursorColor: Colors.white,
        selectionColor: Colors.white.withValues(alpha: 0.4),
      ),
    );
  }
}

/// GeneralLibraryFlutter
class GeneralLibFlutterAppMain extends StatelessWidget {
  /// GeneralLibraryFlutter
  final GeneralLibFlutterApp generalLibFlutterApp;

  /// GeneralLibraryFlutter
  final ThemeData Function(BuildContext context, ThemeData defaultTheme)?
      lightTheme;

  /// GeneralLibraryFlutter
  final ThemeData Function(BuildContext context, ThemeData defaultTheme)?
      darkTheme;

  /// GeneralLibraryFlutter
  final Widget? child;

  /// GeneralLibraryFlutter
  final bool isAutoInitialized;

  /// GeneralLibraryFlutter
  final bool isCanPop;

  /// GeneralLibraryFlutter
  final Widget Function(
    /// GeneralLibraryFlutter
    ThemeMode themeMode,

    /// GeneralLibraryFlutter
    ThemeData lightTheme,

    /// GeneralLibraryFlutter
    ThemeData darkTheme,

    /// GeneralLibraryFlutter
    Widget? widget,
  ) builder;

  const GeneralLibFlutterAppMain({
    /// GeneralLibraryFlutter
    super.key,

    /// GeneralLibraryFlutter
    this.isCanPop = false,

    /// GeneralLibraryFlutter
    required this.generalLibFlutterApp,

    /// GeneralLibraryFlutter
    this.isAutoInitialized = true,

    /// GeneralLibraryFlutter
    this.lightTheme,

    /// GeneralLibraryFlutter
    this.darkTheme,

    /// GeneralLibraryFlutter
    required this.builder,

    /// GeneralLibraryFlutter
    this.child,
  });

  /// GeneralLibraryFlutter
  ThemeData lightTheme_default() {
    return GeneralLibFlutterApp.lightTheme_default();
  }

  /// GeneralLibraryFlutter
  ThemeData darkTheme_default() {
    return GeneralLibFlutterApp.darkTheme_default();
  }

  @override
  Widget build(BuildContext context) {
    final ListenableBuilder listenableBuilder = ListenableBuilder(
      listenable: generalLibFlutterApp,
      child: child,
      builder: (context, child) {
        final lightTheme = this.lightTheme;
        final darkTheme = this.darkTheme;
        if (isAutoInitialized) {
          generalLibFlutterApp.initState(
            context: context,
            themeMode: generalLibFlutterApp.themeMode,
            onSet: () {},
          );
        }
        return builder(
          generalLibFlutterApp.themeMode,
          (lightTheme != null)
              ? lightTheme(context, lightTheme_default())
              : lightTheme_default(),
          (darkTheme != null)
              ? darkTheme(context, darkTheme_default())
              : darkTheme_default(),
          child,
        );
      },
    );
    if (isCanPop == false) {
      return PopScope(
        canPop: isCanPop,
        child: listenableBuilder,
      );
    }
    return listenableBuilder;
  }
}
