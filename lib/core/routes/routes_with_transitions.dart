// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute FadeGoRoute(
    {required String path,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    List<RouteBase> routes = const []}) {
  return GoRoute(path: path, builder: builder, routes: routes);
}

GoRoute VerticalSlideGoRoute({
  required String path,
  required Widget Function(BuildContext context, GoRouterState state) builder,
}) {
  return GoRoute(path: path, builder: builder);
}
