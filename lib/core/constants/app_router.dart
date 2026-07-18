import 'package:claimit_app/core/constants/route_names.dart';
import 'package:claimit_app/features/dashboard/widgets/itemdetails.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:claimit_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:claimit_app/features/auth/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter approuter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.loginpage,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const DashboardScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
    ),
    GoRoute(
      path: RouteNames.dashboard,
      builder: (context, state) => DashboardScreen(),
    ),
    GoRoute(
      path: RouteNames.itemdetails,
      builder: (context, state) => ItemDetailsPage(),
    ),
  ],
);

class Routes {
  static List<GetPage> allRoute = [
    GetPage<dynamic>(
      name: ConstantRoute.loginpage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: ConstantRoute.dashboard,
      page: () => DashboardScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: ConstantRoute.itemdetails,
      page: () => ItemDetailsPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: ConstantRoute.loginpage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
  ];
}
