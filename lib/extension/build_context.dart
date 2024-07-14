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
// ignore_for_file: empty_catches, non_constant_identifier_names

// import 'dart:js';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart' as material;

import "dart:ui" as ui;


extension BuildContextExtension<T> on BuildContext {
  NavigatorState navigator({
    bool rootNavigator = false,
  }) {
    return Navigator.of(this, rootNavigator: rootNavigator);
  }

  MediaQueryData get mediaQueryData {
    return MediaQuery.of(this);
  }

  Orientation get orientation {
    return mediaQueryData.orientation;
  }

  double paddingTop({
    bool isTopPadding = true,
    bool isRightPadding = true,
  }) {
    EdgeInsets padding_data = mediaQueryData.padding;
    if (orientation == Orientation.portrait) {
      if (isTopPadding) {
        return padding_data.top;
      } else {
        return padding_data.bottom;
      }
    }
    if (isRightPadding) {
      return padding_data.right;
    } else {
      return padding_data.left;
    }
  }

  bool get isMobile {
    return MediaQuery.of(this).size.width <= 500.0;
  }

  bool get isTablet {
    return MediaQuery.of(this).size.width < 1024.0 &&
        MediaQuery.of(this).size.width >= 650.0;
  }

  bool get isSmallTablet {
    return MediaQuery.of(this).size.width < 650.0 &&
        MediaQuery.of(this).size.width > 500.0;
  }

  bool get isDesktop {
    return MediaQuery.of(this).size.width >= 1024.0;
  }

  bool get isSmall {
    return MediaQuery.of(this).size.width < 850.0 &&
        MediaQuery.of(this).size.width >= 560.0;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }

  Size get size {
    return MediaQuery.of(this).size;
  }

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
      letterSpacing: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 13.0,
      height: 1.23);

  // colors
  ThemeData get theme => Theme.of(this);

  // colors
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.background;

  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) async {
    return await showModalBottomSheet<T>(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      clipBehavior: Clip.antiAlias,
      builder: (context) => Wrap(
        clipBehavior: Clip.antiAlias,
        children: [child],
      ),
    );
  }

  ScaffoldMessengerState get scaffoldMessenger {
    return ScaffoldMessenger.of(this);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<B?> showDialog<B>({
    required Widget Function(BuildContext context) builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    return await material.showDialog<B>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
      builder: (context) {
        return ScaffoldMessenger(
          child: Builder(
            builder: builder,
          ),
        );
      },
    );
  }

  Future<Uint8List?> toImagePng({
    FutureOr<void> Function(Object error, StackTrace stackTrace)? onError,
  }) async {
    try {
      RenderRepaintBoundary boundary =
          findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage();

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        return null;
      }

      return byteData.buffer.asUint8List();
    } catch (e, stack) {
      if (onError != null) {
        await onError(e, stack);
      }
      return null;
    }
  }

  Future<void> animateScroll({
    double alignment = 0.0,
    Duration? duration,
    Curve curve = Curves.ease,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) async {
    return await Scrollable.ensureVisible(
      this,
      duration: duration ?? const Duration(milliseconds: 500),
      curve: curve,
      alignmentPolicy: alignmentPolicy,
      alignment: alignment,
    );
  }

  Size sizeRenderBox() {
    try {
      return (findRenderObject() as RenderBox).size;
    } catch (e) {}
    return Size.zero;
  }

  Size sizeStatusTopBar() {
    try {
      return Size.fromHeight(
        mediaQueryData.padding.top,
      );
    } catch (e) {}
    return Size.zero;
  }

  Size sizeStatusBottomBar() {
    try {
      return Size.fromHeight(
        mediaQueryData.padding.bottom,
      );
    } catch (e) {}
    return Size.zero;
  }

  Future<T?> showLoadingCircularProgressIndicator<T>({
    bool barrierDismissible = false,
    bool canPop = false,
  }) async {
    return await material.showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      useSafeArea: false,
      useRootNavigator: false,
      builder: (context) {
        return PopScope(
          canPop: canPop,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.theme.dialogBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CircularProgressIndicator(
                color: context.theme.indicatorColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
