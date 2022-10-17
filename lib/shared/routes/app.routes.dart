import 'package:eam_domotic_frontend/auth/screens/sign-in.screen.dart';
import 'package:eam_domotic_frontend/auth/screens/sign-up.screen.dart';
import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/notifications/screens/notification.screen.dart';
import 'package:eam_domotic_frontend/sensors/screens/sensor.screen.dart';
import 'package:eam_domotic_frontend/app-intro/app-intro.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '';
  static final routes = <AppRoute>[
    AppRoute(
      route: 'lights',
      name: 'Lights',
      screen: const LightScreen(),
    ),
    AppRoute(
      route: 'notifications',
      name: 'Notifications',
      screen: const NotificationScreen(),
    ),
    AppRoute(
      route: 'sensors',
      name: 'Sensors',
      screen: const SensorScreen(),
    ),
    AppRoute(route: '', name: 'Introduction', screen: const AppIntroScreen()),
    AppRoute(route: 'signIn', name: 'Sign In', screen: const SignInScreen()),
    AppRoute(route: 'signUp', name: 'Sign Up', screen: const SignUpScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final route in routes) {
      appRoutes.addAll({route.route: (BuildContext context) => route.screen});
    }

    return appRoutes;
  }
}
