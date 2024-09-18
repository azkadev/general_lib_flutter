// ignore_for_file: empty_catches, unnecessary_brace_in_string_interps
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';

typedef RouteWidgetBuilderGeneralLibFlutter = Widget Function(BuildContext context, RouteDataGeneralLibFlutter routeData);

class RouteDataGeneralLibFlutter {
  final String routeName;
  final Object? arguments;
  final BuildContext context;
  // final PageStorageBucket pageStorageBucket;
  RouteDataGeneralLibFlutter({
    required this.routeName,
    required this.arguments,
    required this.context,
    // required this.pageStorageBucket,
  });

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

typedef RouteMapGeneralLibFlutter = Map<String, RouteWidgetBuilderGeneralLibFlutter>;

class RouteGeneralLibFlutter {
  // final PageStorageKey<String> pageStorageKey;
  // final PageStorageBucket pageStorageBucket;
  final RouteWidgetBuilderGeneralLibFlutter onUnknownRoute;
  final RouteMapGeneralLibFlutter Function() onRoute;
  RouteGeneralLibFlutter({
    required this.onUnknownRoute,
    required this.onRoute,
  });

  Widget _build({
    required Widget child,
  }) {
    return child;
  }

  RouteMapGeneralLibFlutter get _route {
    return onRoute();
  }

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

  List<Route<dynamic>> toOnGenerateInitialRoutes(String initialRoute) {
    if (initialRoute == "/") {
      return [
        toRoute(
          RouteSettings(
            name: initialRoute,
          ),
        ),
      ];
    }
    return [
      toRoute(
        const RouteSettings(
          name: "/",
        ),
      ),
      toRoute(
        RouteSettings(
          name: initialRoute,
        ),
      ),
    ];
  }

  Route<T> toOnGenerateRoute<T>(RouteSettings settings) {
    return toRoute(settings);
  }

  Route<T> toOnUnknownRoute<T>(RouteSettings settings) {
    return toRoute(settings);
  }

  Route<T> toRoute<T>(RouteSettings settings) {
    final routeName = settings.name ?? "";
    if (routeName.isNotEmpty) {
      for (final element in _route.entries) {
        if (RegExp(parsePattern(element.key), caseSensitive: false).hasMatch(routeName)) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return _build(
                child: element.value(
                  context,
                  RouteDataGeneralLibFlutter(
                    routeName: settings.name ?? element.key,
                    arguments: settings.arguments,
                    context: context,
                  ),
                ),
              );
            },
          );
        }
      }
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return _build(
          child: onUnknownRoute(
            context,
            RouteDataGeneralLibFlutter(
              routeName: settings.name ?? "",
              arguments: settings.arguments,
              context: context,
            ),
          ),
        );
      },
    );
  }

  Map<String, WidgetBuilder> toRoutes({
    Map<String, WidgetBuilder>? otherRoutes,
  }) {
    final Map<String, WidgetBuilder> result = {};
    for (final element in _route.entries) {
      result[element.key] = (context) {
        final RouteSettings routeSettings = () {
          try {
            final ModalRoute? modal = ModalRoute.of(context);
            if (modal != null) {
              return modal.settings;
            }
          } catch (e) {}
          return RouteSettings(name: element.key);
        }();
        return _build(
          child: element.value(
            context,
            RouteDataGeneralLibFlutter(
              routeName: routeSettings.name ?? element.key,
              arguments: routeSettings.arguments,
              context: context,
            ),
          ),
        );
      };
    }
    result.addAll(otherRoutes ?? {});
    return result;
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
      routes: toRoutes(),
      initialRoute: initialRoute,
      onGenerateInitialRoutes: toOnGenerateInitialRoutes,
      onUnknownRoute: toOnUnknownRoute,
      onGenerateRoute: toOnGenerateRoute,

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
