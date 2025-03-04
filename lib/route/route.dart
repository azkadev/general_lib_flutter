// ignore_for_file: empty_catches, unnecessary_brace_in_string_interps

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';
import 'package:general_lib_flutter/extension/connection_state.dart';

/// GeneralLibraryFlutter
typedef RouteWidgetBuilderGeneralLibFlutter<T> = T Function(
  /// GeneralLibraryFlutter
  BuildContext context,

  /// GeneralLibraryFlutter
  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter,
);

/// GeneralLibraryFlutter
typedef RouteMapGeneralLibFlutter
    = Map<String, RouteWidgetBuilderGeneralLibFlutter<dynamic>>;

/// GeneralLibraryFlutter
class RouteDataGeneralLibFlutter {
  /// GeneralLibraryFlutter
  final String routeName;

  /// GeneralLibraryFlutter
  final Object? arguments;

  /// GeneralLibraryFlutter
  final BuildContext context;

  /// GeneralLibraryFlutter
  const RouteDataGeneralLibFlutter({
    /// GeneralLibraryFlutter
    required this.routeName,

    /// GeneralLibraryFlutter
    required this.arguments,

    /// GeneralLibraryFlutter
    required this.context,
  });

  /// GeneralLibraryFlutter
  RouteDataGeneralLibFlutter copyWith({
    /// GeneralLibraryFlutter
    String? routeName,

    /// GeneralLibraryFlutter
    Object? arguments,

    /// GeneralLibraryFlutter
    BuildContext? context,
  }) {
    return RouteDataGeneralLibFlutter(
      routeName: routeName ?? this.routeName,
      arguments: arguments ?? this.arguments,
      context: context ?? this.context,
    );
  }

  /// GeneralLibraryFlutter
  String get path {
    return routeName;
  }

  /// GeneralLibraryFlutter
  Uri get uri {
    if (kIsWeb) {
      return Uri.base;
    }
    return Uri.base.replace(
      path: path,
    );
  }

  /// GeneralLibraryFlutter
  T builder<T>({
    /// GeneralLibraryFlutter
    required T Function() onBuilder,
  }) {
    return onBuilder();
  }

  /// GeneralLibraryFlutter
  static RouteDataGeneralLibFlutter auto({
    /// GeneralLibraryFlutter
    required BuildContext context,

    /// GeneralLibraryFlutter
    required RouteSettings settings,
  }) {
    return RouteDataGeneralLibFlutter(
      routeName: settings.name ?? "",
      arguments: settings.arguments,
      context: context,
    );
  }

  /// GeneralLibraryFlutter
  static RouteDataGeneralLibFlutter? maybeOf(BuildContext context) {
    final modal = ModalRoute.of(context);
    if (modal == null) {
      return null;
    }
    final routeName = modal.settings.name;
    if (routeName == null) {
      return null;
    }
    return RouteDataGeneralLibFlutter(
      routeName: routeName,
      arguments: modal.settings.arguments,
      context: context,
    );
  }

  /// GeneralLibraryFlutter
  static RouteDataGeneralLibFlutter of(BuildContext context) {
    return RouteDataGeneralLibFlutter.maybeOf(context) ??
        RouteDataGeneralLibFlutter(
          routeName: "",
          arguments: null,
          context: context,
        );
  }
}

/// GeneralLibraryFlutter
class RouteGeneralLibFlutter {
  /// GeneralLibraryFlutter
  final RouteWidgetBuilderGeneralLibFlutter<dynamic> onNotFoundRoute;

  /// GeneralLibraryFlutter
  final RouteWidgetBuilderGeneralLibFlutter<Widget> onErrorRoute;

  /// GeneralLibraryFlutter
  final RouteMapGeneralLibFlutter routers = {};

  /// GeneralLibraryFlutter
  RouteGeneralLibFlutter({
    /// GeneralLibraryFlutter
    required this.onErrorRoute,

    /// GeneralLibraryFlutter
    required this.onNotFoundRoute,
  });

  /// GeneralLibraryFlutter
  String parsePattern(
    /// GeneralLibraryFlutter
    String path,
  ) {
    String getPattern = "";
    if (path == "/") {
      getPattern = "^${path}\$";
    } else {
      if (!RegExp(r"^(/)").hasMatch(path)) {
        getPattern = "^/${path}";
      } else {
        getPattern = path;
      }
    }
    return getPattern;
  }

  /// GeneralLibraryFlutter
  void all(
    /// GeneralLibraryFlutter
    String path,

    /// GeneralLibraryFlutter
    RouteWidgetBuilderGeneralLibFlutter<dynamic>
        routeWidgetBuilderGeneralLibFlutter,
  ) {
    routers[path] = routeWidgetBuilderGeneralLibFlutter;
  }

  /// GeneralLibraryFlutter
  void poast(
    /// GeneralLibraryFlutter
    String path,

    /// GeneralLibraryFlutter
    RouteWidgetBuilderGeneralLibFlutter<dynamic>
        routeWidgetBuilderGeneralLibFlutter,
  ) {
    all(path, routeWidgetBuilderGeneralLibFlutter);
  }

  /// GeneralLibraryFlutter
  void get(
    /// GeneralLibraryFlutter
    String path,

    /// GeneralLibraryFlutter
    RouteWidgetBuilderGeneralLibFlutter<dynamic>
        routeWidgetBuilderGeneralLibFlutter,
  ) {
    all(path, routeWidgetBuilderGeneralLibFlutter);
  }

  /// GeneralLibraryFlutter
  void head(
    /// GeneralLibraryFlutter
    String path,

    /// GeneralLibraryFlutter
    RouteWidgetBuilderGeneralLibFlutter<dynamic>
        routeWidgetBuilderGeneralLibFlutter,
  ) {
    all(path, routeWidgetBuilderGeneralLibFlutter);
  }

  /// GeneralLibraryFlutter
  Widget anyDataToWidget({
    /// GeneralLibraryFlutter
    required dynamic data,

    /// GeneralLibraryFlutter
    required BuildContext context,
  }) {
    if (data is Widget) {
      return data;
    }
    if (data is Future) {
      return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          final snapshotData = snapshot.data;
          final isLoading = snapshot.connectionState.isLoading;
          if (isLoading) {
            return const CircularProgressIndicator();
          }
          return anyDataToWidget(data: snapshotData, context: context);
        },
      );
    }
    throw ErrorDescription("Data Not Widget Type");
  }

  /// GeneralLibraryFlutter
  Route<T> route<T>(
    /// GeneralLibraryFlutter
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        final routeDataGeneralLibFlutter = RouteDataGeneralLibFlutter.auto(
            context: context, settings: settings);
        try {
          for (final routeMapGeneralLibFlutter in routers.entries) {
            if (routeMapGeneralLibFlutter.key.toLowerCase() ==
                routeDataGeneralLibFlutter.path.toLowerCase()) {
              final child = routeMapGeneralLibFlutter.value(
                  context, routeDataGeneralLibFlutter);
              if (child != null) {
                return anyDataToWidget(data: child, context: context);
              }
            }
          }
          return anyDataToWidget(
              data: onNotFoundRoute(context, routeDataGeneralLibFlutter),
              context: context);
        } catch (e) {
          return onErrorRoute(context, routeDataGeneralLibFlutter);
        }
      },
    );
  }

  /// GeneralLibraryFlutter
  MaterialApp toMaterialApp({
    /// GeneralLibraryFlutter
    Key? key,

    /// GeneralLibraryFlutter
    GlobalKey<NavigatorState>? navigatorKey,

    /// GeneralLibraryFlutter
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,

    /// GeneralLibraryFlutter
    Widget? home,

    /// GeneralLibraryFlutter
    String initialRoute = "/",

    /// GeneralLibraryFlutter
    bool Function(NavigationNotification navigationNotification)?
        onNavigationNotification,

    /// GeneralLibraryFlutter
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],

    /// GeneralLibraryFlutter
    Widget Function(BuildContext context, Widget? widget)? builder,

    /// GeneralLibraryFlutter
    String title = '',

    /// GeneralLibraryFlutter
    String Function(BuildContext context)? onGenerateTitle,

    /// GeneralLibraryFlutter
    Color? color,

    /// GeneralLibraryFlutter
    ThemeData? theme,

    /// GeneralLibraryFlutter
    ThemeData? darkTheme,

    /// GeneralLibraryFlutter
    ThemeData? highContrastTheme,

    /// GeneralLibraryFlutter
    ThemeData? highContrastDarkTheme,

    /// GeneralLibraryFlutter
    ThemeMode? themeMode = ThemeMode.system,

    /// GeneralLibraryFlutter
    Duration themeAnimationDuration = kThemeAnimationDuration,

    /// GeneralLibraryFlutter
    Curve themeAnimationCurve = Curves.linear,

    /// GeneralLibraryFlutter
    Locale? locale,

    /// GeneralLibraryFlutter
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,

    /// GeneralLibraryFlutter

    Locale? Function(List<Locale>? locales, Iterable<Locale> supportedLocales)?
        localeListResolutionCallback,

    /// GeneralLibraryFlutter
    Locale? Function(Locale? locale, Iterable<Locale> supportedLocales)?
        localeResolutionCallback,

    /// GeneralLibraryFlutter
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],

    /// GeneralLibraryFlutter
    bool debugShowMaterialGrid = false,

    /// GeneralLibraryFlutter
    bool showPerformanceOverlay = false,

    /// GeneralLibraryFlutter
    bool checkerboardRasterCacheImages = false,

    /// GeneralLibraryFlutter
    bool checkerboardOffscreenLayers = false,

    /// GeneralLibraryFlutter
    bool showSemanticsDebugger = false,

    /// GeneralLibraryFlutter
    bool debugShowCheckedModeBanner = true,

    /// GeneralLibraryFlutter
    Map<ShortcutActivator, Intent>? shortcuts,

    /// GeneralLibraryFlutter
    Map<Type, Action<Intent>>? actions,

    /// GeneralLibraryFlutter
    String? restorationScopeId,

    /// GeneralLibraryFlutter
    ScrollBehavior? scrollBehavior,

    /// GeneralLibraryFlutter
    bool useInheritedMediaQuery = false,

    /// GeneralLibraryFlutter
    AnimationStyle? themeAnimationStyle,
  }) {
    return MaterialApp(
      initialRoute: initialRoute,
      onUnknownRoute: route,
      key: key,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      actions: actions,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: useInheritedMediaQuery,
      restorationScopeId: restorationScopeId,
      localeResolutionCallback: localeResolutionCallback,
      localeListResolutionCallback: localeListResolutionCallback,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      theme: theme,
      themeAnimationCurve: themeAnimationCurve,
      themeAnimationDuration: themeAnimationDuration,
      themeAnimationStyle: themeAnimationStyle,
      themeMode: themeMode,
      title: title,
      onGenerateTitle: onGenerateTitle,
      onNavigationNotification: onNavigationNotification,
      navigatorObservers: navigatorObservers,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showPerformanceOverlay: showPerformanceOverlay,
      scrollBehavior: scrollBehavior,
      shortcuts: shortcuts,
      showSemanticsDebugger: showSemanticsDebugger,
      supportedLocales: supportedLocales,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      debugShowMaterialGrid: debugShowMaterialGrid,
      highContrastDarkTheme: highContrastDarkTheme,
      localizationsDelegates: localizationsDelegates,
      highContrastTheme: highContrastTheme,
      home: home,
      locale: locale,
      color: color,
      builder: builder,
    );
  }
}

/// GeneralLibraryFlutter
class RouterGeneralLibFlutter {
  /// GeneralLibraryFlutter
  final BuildContext context;

  /// GeneralLibraryFlutter
  final bool rootNavigator;

  /// GeneralLibraryFlutter
  RouterGeneralLibFlutter({
    /// GeneralLibraryFlutter
    required this.context,

    /// GeneralLibraryFlutter
    required this.rootNavigator,
  });

  /// GeneralLibraryFlutter
  static RouterGeneralLibFlutter of(
    /// GeneralLibraryFlutter
    BuildContext context, {
    /// GeneralLibraryFlutter
    bool rootNavigator = false,
  }) {
    return RouterGeneralLibFlutter(
        context: context, rootNavigator: rootNavigator);
  }

  /// GeneralLibraryFlutter
  NavigatorState get navigator {
    return context.navigator(rootNavigator: rootNavigator);
  }

  /// GeneralLibraryFlutter
  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter() {
    return RouteDataGeneralLibFlutter.of(context);
  }

  /// GeneralLibraryFlutter
  Future<T?> pushNamed<T extends Object?>({
    /// GeneralLibraryFlutter
    required String routeName,

    /// GeneralLibraryFlutter
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// GeneralLibraryFlutter
  Future<T?> pushAndRemoveUntil<T extends Object?>({
    /// GeneralLibraryFlutter
    required Route<T> newRoute,

    /// GeneralLibraryFlutter
    required String routeName,
  }) {
    return navigator.pushAndRemoveUntil<T>(
      newRoute,
      ModalRoute.withName(routeName),
    );
  }

  /// GeneralLibraryFlutter
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>({
    /// GeneralLibraryFlutter
    required String routeName,

    /// GeneralLibraryFlutter
    required String removeRouteName,

    /// GeneralLibraryFlutter
    Object? arguments,

    /// GeneralLibraryFlutter
    bool rootNavigator = false,
  }) {
    return navigator.pushNamedAndRemoveUntil<T>(
      routeName,
      ModalRoute.withName(removeRouteName),
      arguments: arguments,
    );
  }

  /// GeneralLibraryFlutter
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>({
    /// GeneralLibraryFlutter
    required String routeName,

    /// GeneralLibraryFlutter
    Object? arguments,

    /// GeneralLibraryFlutter
    TO? result,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// GeneralLibraryFlutter
  void activate() {
    // ignore: invalid_use_of_protected_member
    navigator.activate();
  }

  /// GeneralLibraryFlutter
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    /// GeneralLibraryFlutter
    String routeName, {
    /// GeneralLibraryFlutter
    TO? result,

    /// GeneralLibraryFlutter
    Object? arguments,
  }) {
    return navigator.popAndPushNamed<T, TO>(routeName,
        result: result, arguments: arguments);
  }
}

/// GeneralLibraryFlutter
extension RouteGeneralLibFlutterBuildContextExtension<T> on BuildContext {
  /// GeneralLibraryFlutter
  RouterGeneralLibFlutter routerGeneralLibFlutter() {
    return RouterGeneralLibFlutter.of(this);
  }

  /// GeneralLibraryFlutter
  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter() {
    return RouteDataGeneralLibFlutter.of(this);
  }
}

/// GeneralLibraryFlutter
extension RouteGeneralLibFlutterGeneralLibFlutterStateExtension<
    T extends StatefulWidget> on State<T> {
  /// GeneralLibraryFlutter
  RouterGeneralLibFlutter routerGeneralLibFlutter() {
    return RouterGeneralLibFlutter.of(context);
  }

  /// GeneralLibraryFlutter
  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter() {
    return RouteDataGeneralLibFlutter.of(context);
  }
}

/// GeneralLibraryFlutter
extension RouteGeneralLibFlutterGeneralLibFlutterStatelessWidgetExtension<
    T extends StatelessWidget> on T {
  /// GeneralLibraryFlutter
  RouterGeneralLibFlutter routerGeneralLibFlutter({
    /// GeneralLibraryFlutter
    required BuildContext context,
  }) {
    return RouterGeneralLibFlutter.of(context);
  }

  /// GeneralLibraryFlutter
  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter({
    /// GeneralLibraryFlutter
    required BuildContext context,
  }) {
    return RouteDataGeneralLibFlutter.of(context);
  }
}
