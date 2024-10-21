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

  Router<A> router<A extends Object?>() {
    return Router.of<A>(this);
  }

  PageStorageBucket? get pageStorageBucketMaybeOf {
    return PageStorage.maybeOf(this);
  }

  PageStorageBucket get pageStorageBucket {
    return PageStorage.of(this);
  }

  BoxConstraints boxConstraints({
    double? minWidth,
    double maxWidth = double.infinity,
    double? minHeight,
    double maxHeight = double.infinity,
  }) {
    return BoxConstraints(
      minHeight: minHeight ?? height,
      minWidth: minWidth ?? width,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
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
    final EdgeInsets padding_data = mediaQueryData.padding;
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
    return mediaQueryData.size.width <= 500.0;
  }

  bool get isTablet {
    return mediaQueryData.size.width < 1024.0 && mediaQueryData.size.width >= 650.0;
  }

  bool get isSmallTablet {
    return mediaQueryData.size.width < 650.0 && mediaQueryData.size.width > 500.0;
  }

  bool get isDesktop {
    return mediaQueryData.size.width >= 1024.0;
  }

  bool get isSmall {
    return mediaQueryData.size.width < 850.0 && mediaQueryData.size.width >= 560.0;
  }

  double get width {
    try {
      return mediaQueryData.size.width;
    } catch (e) {
      return 0;
    }
  }

  double get height {
    try {
      return mediaQueryData.size.height;
    } catch (e) {
      return 0;
    }
  }

  Size get size {
    return mediaQueryData.size;
  }

  TextStyle? get displayMedium => theme.textTheme.displayMedium;

  TextStyle? get displaySmall => theme.textTheme.displaySmall;

  TextStyle? get headlineLarge => theme.textTheme.headlineLarge;

  TextStyle? get headlineMedium => theme.textTheme.headlineMedium;

  TextStyle? get titleLarge => theme.textTheme.titleLarge;

  TextStyle? get titleMedium => theme.textTheme.titleMedium;

  TextStyle? get titleSmall => theme.textTheme.titleSmall;

  TextStyle? get labelLarge => theme.textTheme.labelLarge;

  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  TextStyle? get titleTextStyle => theme.appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall => bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(letterSpacing: 1.5, fontWeight: FontWeight.w700, fontSize: 13.0, height: 1.23);

  // colors
  ThemeData get theme => Theme.of(this);

  // colors
  Color get primaryColor => theme.primaryColor;

  Color get primaryColorDark => theme.primaryColorDark;

  Color get primaryColorLight => theme.primaryColorLight;

  Color get primary => theme.colorScheme.primary;

  Color get onPrimary => theme.colorScheme.onPrimary;

  Color get secondary => theme.colorScheme.secondary;

  Color get onSecondary => theme.colorScheme.onSecondary;

  Color get cardColor => theme.cardColor;

  Color get errorColor => theme.colorScheme.error;

  Color get background => theme.colorScheme.surface;

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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(String message) {
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
    double pixelRatio = 1.0,
    FutureOr<void> Function(Object error, StackTrace stackTrace)? onError,
  }) async {
    try {
      final RenderRepaintBoundary boundary = findRenderObject() as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage(
        pixelRatio: pixelRatio,
      );

      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
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
    ScrollPositionAlignmentPolicy alignmentPolicy = ScrollPositionAlignmentPolicy.explicit,
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

  // ignore: avoid_shadowing_type_parameters
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

  BoxDecoration extensionGeneralLibFlutterBoxDecoration({
    required bool isUseBorderAll,
    required bool isUseBoxShadow,
  }) {
    return BoxDecoration(
      border: isUseBorderAll ? extensionGeneralLibFlutterBorderAll() : null,
      boxShadow: isUseBoxShadow ? extensionGeneralLibFlutterBoxShadows() : null,
    );
  }

  Border extensionGeneralLibFlutterBorderAll() {
    return Border.all(
      color: theme.indicatorColor,
    );
  }

  List<BoxShadow> extensionGeneralLibFlutterBoxShadows() {
    return [
      BoxShadow(
        color: theme.shadowColor.withAlpha(110),
        spreadRadius: 2.5,
        blurRadius: 3,
        offset: const Offset(0, 0), // changes position of shadow
      ),
    ];
  }

  List<Shadow> extensionGeneralLibFlutterShadows() {
    return [
      BoxShadow(
        color: theme.shadowColor.withAlpha(110),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ];
  }

  Size extensionGeneralLibFlutterSizePhotoLarge() {
    final size_procces = (height + width) * .2;
    return Size(
      size_procces,
      size_procces,
    );
  }

  Size extensionGeneralLibFlutterSizePhotoMedium() {
    final size_procces = (height + width) * .1;
    return Size(
      size_procces,
      size_procces,
    );
  }

  Size extensionGeneralLibFlutterSizePhotoSmall() {
    final size_procces = (height + width) * .025;
    return Size(
      size_procces,
      size_procces,
    );
  }
}
