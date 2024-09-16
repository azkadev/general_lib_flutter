// ignore_for_file: empty_catches
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/extension/build_context.dart';

typedef RouteWidgetBuilderGeneralLibFlutter = Widget Function(BuildContext context, RouteDataGeneralLibFlutter routeData);

class RouteDataGeneralLibFlutter {
  final String routeName;
  final Object? arguments;
  final BuildContext context;
  final PageStorageBucket pageStorageBucket;
  RouteDataGeneralLibFlutter({
    required this.routeName,
    required this.arguments,
    required this.context,
    required this.pageStorageBucket,
  });

  String get path {
    return routeName;
  }

  Uri get uri {
    return Uri.base.replace(
      path: path,
    );
  }

  dynamic get body {
    try {
      return (pageStorageBucket.readState(context, identifier: "${routeName}_parameters"));
    } catch (e) {}
    return null;
  }
}

typedef RouteMapGeneralLibFlutter = Map<String, RouteWidgetBuilderGeneralLibFlutter>;

class RouteGeneralLibFlutter {
  final PageStorageKey<String> pageStorageKey;
  final PageStorageBucket pageStorageBucket;
  final RouteWidgetBuilderGeneralLibFlutter onUnknownRoute;
  final RouteMapGeneralLibFlutter Function() onRoute;
  RouteGeneralLibFlutter({
    required String key,
    required this.pageStorageBucket,
    required this.onUnknownRoute,
    required this.onRoute,
  }) : pageStorageKey = PageStorageKey(key);

  Widget _build(Widget child) {
    return PageStorage(
      key: pageStorageKey,
      bucket: pageStorageBucket,
      child: child,
    );
  }

  RouteMapGeneralLibFlutter get _route {
    return onRoute();
  }

  Route<T> toOnUnknownRoute<T>(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return _build(onUnknownRoute(
          context,
          RouteDataGeneralLibFlutter(
            routeName: settings.name ?? "",
            arguments: settings.arguments,
            context: context,
            pageStorageBucket: pageStorageBucket,
          ),
        ));
      },
    );
  }

  Map<String, Widget Function(BuildContext context)> toRoutes({
    Map<String, Widget Function(BuildContext context)>? otherRoutes,
  }) {
    final Map<String, Widget Function(BuildContext context)> result = {};
    for (final element in _route.entries) {
      result[element.key] = (context) {
        return _build(element.value(context, RouteDataGeneralLibFlutter(routeName: element.key, arguments: null, context: context, pageStorageBucket: pageStorageBucket)));
      };
    }
    result.addAll(otherRoutes ?? {});
    return result;
  }
}

extension RouteGeneralLibFlutterExtensionBuildContext on BuildContext {
  void _writeParameters({
    required String routeName,
    required dynamic parameters,
  }) {
    try {
      pageStorageBucket.writeState(this, parameters, identifier: "${routeName}_parameters");
    } catch (e) {}
  }

  Future<T?> routeGeneralLibFlutterPushNamed<T extends Object?>({
    required String routeName,
    required dynamic parameters,
    bool rootNavigator = false,
  }) {
    _writeParameters(routeName: routeName, parameters: parameters);
    return navigator(rootNavigator: rootNavigator).pushNamed(
      routeName,
      arguments: parameters,
    );
  }

  Future<T?> routeGeneralLibFlutterPushAndRemoveUntil<T extends Object?>({
    required Route<T> newRoute,
    required String routeName,
    required dynamic parameters,
    bool rootNavigator = false,
  }) {
    _writeParameters(routeName: routeName, parameters: parameters);
    return navigator(rootNavigator: rootNavigator).pushAndRemoveUntil(
      newRoute,
      ModalRoute.withName(routeName),
    );
  }
}
