import 'package:eam_domotic_frontend/auth/screens/sign-in.screen.dart';
import 'package:eam_domotic_frontend/auth/screens/sign-up.screen.dart';
import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/app-intro/app-intro.module.dart';

import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = '';
  static final routes = <AppRoute>[
    AppRoute(route: '', name: 'Introduction', screen: const AppIntroScreen()),
    AppRoute(route: 'signIn', name: 'Sign In', screen: const SignInScreen()),
    AppRoute(route: 'signUp', name: 'Sign Up', screen: const SignUpScreen()),
    AppRoute(route: 'lights', name: 'Lights', screen: const LightScreen()),
    //Route(route: 'notifications', name: 'Notifications', screen: screen),
    //Route(route: 'sensors', name: 'Sensors', screen: screen),
    //Route(route: 'log-in', name: 'Log-in', screen: screen),
    //Route(route: 'Log-out', name: 'Log-out', screen: screen),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final route in routes) {
      appRoutes.addAll({route.route: (BuildContext context) => route.screen});
    }

    return appRoutes;
  }
}
