// ignore_for_file: empty_catches, unnecessary_brace_in_string_interps

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';
import 'package:general_lib_flutter/extension/connection_state.dart';

typedef RouteWidgetBuilderGeneralLibFlutter<T> = T Function(BuildContext context, RouteDataGeneralLibFlutter routeDataGeneralLibFlutter);

typedef RouteMapGeneralLibFlutter = Map<String, RouteWidgetBuilderGeneralLibFlutter<dynamic>>;

class RouteDataGeneralLibFlutter {
  final String routeName;
  final Object? arguments;
  final BuildContext context;
  // final PageStorageBucket pageStorageBucket;
  const RouteDataGeneralLibFlutter({
    required this.routeName,
    required this.arguments,
    required this.context,
    // required this.pageStorageBucket,
  });

  RouteDataGeneralLibFlutter copyWith({
    String? routeName,
     Object? arguments,
     BuildContext? context,
  }) {
    return RouteDataGeneralLibFlutter(
      routeName: routeName ?? this.routeName,
      arguments: arguments ?? this.arguments,
      context: context ?? this.context,
    );
  }

  String get path {
    return routeName;
  }

  Uri get uri {
    if (kIsWeb) {
      return Uri.base;
    }
    return Uri.base.replace(
      path: path,
    );
  }

  T builder<T>({
    required T Function() onBuilder,
  }) {
    return onBuilder();
  }

  static RouteDataGeneralLibFlutter auto({
    required BuildContext context,
    required RouteSettings settings,
  }) {
    return RouteDataGeneralLibFlutter(
      routeName: settings.name ?? "",
      arguments: settings.arguments,
      context: context,
    );
  }

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

  static RouteDataGeneralLibFlutter of(BuildContext context) {
    return RouteDataGeneralLibFlutter.maybeOf(context) ??
        RouteDataGeneralLibFlutter(
          routeName: "",
          arguments: null,
          context: context,
        );
  }
}

class RouteGeneralLibFlutter {
  final RouteWidgetBuilderGeneralLibFlutter<dynamic> onNotFoundRoute;
  final RouteWidgetBuilderGeneralLibFlutter<Widget> onErrorRoute;
  final RouteMapGeneralLibFlutter routers = {};

  RouteGeneralLibFlutter({
    required this.onErrorRoute,
    required this.onNotFoundRoute,
  });

  String parsePattern(String path) {
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

  void all(String path, RouteWidgetBuilderGeneralLibFlutter<dynamic> routeWidgetBuilderGeneralLibFlutter) {
    routers[path] = routeWidgetBuilderGeneralLibFlutter;
  }

  void poast(String path, RouteWidgetBuilderGeneralLibFlutter<dynamic> routeWidgetBuilderGeneralLibFlutter) {
    all(path, routeWidgetBuilderGeneralLibFlutter);
  }

  void get(String path, RouteWidgetBuilderGeneralLibFlutter<dynamic> routeWidgetBuilderGeneralLibFlutter) {
    all(path, routeWidgetBuilderGeneralLibFlutter);
  }

  void head(String path, RouteWidgetBuilderGeneralLibFlutter<dynamic> routeWidgetBuilderGeneralLibFlutter) {
    all(path, routeWidgetBuilderGeneralLibFlutter);
  }

  Widget anyDataToWidget({
    required dynamic data,
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

  Route<T> route<T>(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        final routeDataGeneralLibFlutter = RouteDataGeneralLibFlutter.auto(context: context, settings: settings);
        try {
          for (final routeMapGeneralLibFlutter in routers.entries) {
            if (routeMapGeneralLibFlutter.key.toLowerCase() == routeDataGeneralLibFlutter.path.toLowerCase()) {
              final child = routeMapGeneralLibFlutter.value(context, routeDataGeneralLibFlutter);
              if (child != null) {
                return anyDataToWidget(data: child, context: context);
              }
            }
          }
          return anyDataToWidget(data: onNotFoundRoute(context, routeDataGeneralLibFlutter), context: context);
        } catch (e) {
          return onErrorRoute(context, routeDataGeneralLibFlutter);
        }
      },
    );
  }

  MaterialApp toMaterialApp({
    Key? key,
    GlobalKey<NavigatorState>? navigatorKey,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
    Widget? home,
    String initialRoute = "/",
    bool Function(NavigationNotification navigationNotification)? onNavigationNotification,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    Widget Function(BuildContext context, Widget? widget)? builder,
    String title = '',
    String Function(BuildContext context)? onGenerateTitle,
    Color? color,
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeData? highContrastTheme,
    ThemeData? highContrastDarkTheme,
    ThemeMode? themeMode = ThemeMode.system,
    Duration themeAnimationDuration = kThemeAnimationDuration,
    Curve themeAnimationCurve = Curves.linear,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Locale? Function(List<Locale>? locales, Iterable<Locale> supportedLocales)? localeListResolutionCallback,
    Locale? Function(Locale? locale, Iterable<Locale> supportedLocales)? localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool debugShowMaterialGrid = false,
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = true,
    Map<ShortcutActivator, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    String? restorationScopeId,
    ScrollBehavior? scrollBehavior,
    bool useInheritedMediaQuery = false,
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

class RouterGeneralLibFlutter {
  final BuildContext context;
  final bool rootNavigator;
  RouterGeneralLibFlutter({
    required this.context,
    required this.rootNavigator,
  });

  static RouterGeneralLibFlutter of(
    BuildContext context, {
    bool rootNavigator = false,
  }) {
    return RouterGeneralLibFlutter(context: context, rootNavigator: rootNavigator);
  }

  NavigatorState get navigator {
    return context.navigator(rootNavigator: rootNavigator);
  }

  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter() {
    return RouteDataGeneralLibFlutter.of(context);
  }

  Future<T?> pushNamed<T extends Object?>({
    required String routeName,
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>({
    required Route<T> newRoute,
    required String routeName,
  }) {
    return navigator.pushAndRemoveUntil<T>(
      newRoute,
      ModalRoute.withName(routeName),
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>({
    required String routeName,
    required String removeRouteName,
    Object? arguments,
    bool rootNavigator = false,
  }) {
    return navigator.pushNamedAndRemoveUntil<T>(
      routeName,
      ModalRoute.withName(removeRouteName),
      arguments: arguments,
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>({
    required String routeName,
    Object? arguments,
    TO? result,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  void activate() {
    navigator.activate();
  }

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(String routeName, {TO? result, Object? arguments}) {
    return navigator.popAndPushNamed<T, TO>(routeName, result: result, arguments: arguments);
  }
}

extension RouteGeneralLibFlutterBuildContextExtension<T> on BuildContext {
  RouterGeneralLibFlutter routerGeneralLibFlutter() {
    return RouterGeneralLibFlutter.of(this);
  }

  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter() {
    return RouteDataGeneralLibFlutter.of(this);
  }
}

extension RouteGeneralLibFlutterGeneralLibFlutterStateExtension<T extends StatefulWidget> on State<T> {
  RouterGeneralLibFlutter routerGeneralLibFlutter() {
    return RouterGeneralLibFlutter.of(context);
  }

  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter() {
    return RouteDataGeneralLibFlutter.of(context);
  }
}

extension RouteGeneralLibFlutterGeneralLibFlutterStatelessWidgetExtension<T extends StatelessWidget> on T {
  RouterGeneralLibFlutter routerGeneralLibFlutter({
    required BuildContext context,
  }) {
    return RouterGeneralLibFlutter.of(context);
  }

  RouteDataGeneralLibFlutter routeDataGeneralLibFlutter({
    required BuildContext context,
  }) {
    return RouteDataGeneralLibFlutter.of(context);
  }
}
