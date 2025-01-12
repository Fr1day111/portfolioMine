import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/utils/routes/route_names.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/contact_me_view.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:portfolio/views/project_view.dart';
import 'package:portfolio/views/skill_views.dart';
import 'package:portfolio/widgets/appbar_buttons.dart';

class Routes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _mainAppNavigatorKey = GlobalKey<NavigatorState>();
  static late final GoRouter _router;

  static GoRouter get router => _router;

  static bool _isInitialized = false;

  Routes._();

  static void init() {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesName.homePage,
      routes: _routes,
    );
  }

  static final _routes = <RouteBase>[_rootRoutes];

  static final ShellRoute _rootRoutes =
      ShellRoute(builder: (context, state, child) => child, routes: [

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MyTabBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutesName.homePage,
            builder: (context, state) => const HomePage(),
          ),
        ]),

        // /// tools page
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutesName.aboutMe,
            builder: (context, state) => const AboutMe(),
          ),
        ]),
        //
        // /// Calender Screen
        // StatefulShellBranch(routes: [
        //   GoRoute(
        //     path: RoutesName.journey,
        //     builder: (context, state) => const MySkillsView(),
        //   ),
        // ]),
        //
        // /// To Do Screen
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutesName.projects,
            builder: (context, state) => const ProjectView(),
          ),
        ]),

        /// Profile Screen
        StatefulShellBranch(routes: [
          GoRoute(
            path: RoutesName.contactMe,
            builder: (context, state) => const ContactMeView(),
          ),
        ]),
      ],
    ),
  ]);
}
