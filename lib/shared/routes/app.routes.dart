import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/notifications/screens/notification.screen.dart';
import 'package:eam_domotic_frontend/sensors/screens/sensor.screen.dart';
import 'package:eam_domotic_frontend/app-intro/app-intro.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  final initialRoute = '';
  final BuildContext context;

  var routes = <AppRoute>[];

  AppRoutes(this.context) {
    routes = <AppRoute>[
      AppRoute(
        route: 'lights',
        name: 'Lights',
        screen: const LightScreen(),
        drawerNavigable: true,
      ),
      AppRoute(
          route: 'notifications',
          name: 'Notifications',
          screen: const NotificationScreen(),
          drawerNavigable: true),
      AppRoute(
        route: 'sensors',
        name: 'Sensors',
        screen: const SensorScreen(),
        drawerNavigable: true,
      ),
      AppRoute(
        route: '',
        name: 'Introduction',
        screen: const AppIntroScreen(),
      ),
      AppRoute(
        route: 'signIn',
        name: 'Sign In',
        screen: const SignInScreen(),
      ),
      AppRoute(
        route: 'signUp',
        name: 'Sign Up',
        screen: const SignUpScreen(),
      ),
    ];
  }

  Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final route in routes) {
      appRoutes.addAll({route.route: (BuildContext context) => route.screen});
    }

    return appRoutes;
  }
}
