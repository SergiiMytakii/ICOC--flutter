// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute FadeGoRoute(
    {required String path,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    List<RouteBase> routes = const []}) {
  return GoRoute(
      path: path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 500),
          key: state.pageKey,
          child: builder(context, state),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: routes);
}

GoRoute VerticalSlideGoRoute({
  required String path,
  required Widget Function(BuildContext context, GoRouterState state) builder,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 800),
        reverseTransitionDuration: const Duration(milliseconds: 800),
        key: state.pageKey,
        child: builder(context, state),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0, 1);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    },
  );
}
