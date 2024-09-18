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
    Object? parameters,
  }) {
    return navigator.pushNamed(
      routeName,
      arguments: parameters,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>({
    required Route<T> newRoute,
    required String routeName,
    Object? parameters,
  }) {
    return navigator.pushAndRemoveUntil(
      newRoute,
      ModalRoute.withName(routeName),
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>({
    required String routeName,
    required dynamic parameters,
    bool rootNavigator = false,
  }) {
    return navigator.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(routeName),
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>({
    required String routeName,
    Object? parameters,
    TO? result,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: parameters,
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
