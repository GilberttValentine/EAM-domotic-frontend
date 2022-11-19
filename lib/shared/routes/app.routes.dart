import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/notifications/screens/notification.screen.dart';
import 'package:eam_domotic_frontend/sensors/screens/sensor.screen.dart';
import 'package:eam_domotic_frontend/app-intro/app-intro.module.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        service: Provider.of<LightService>(context),
      ),
      AppRoute(
        route: 'notifications',
        name: 'Notifications',
        screen: const NotificationScreen(),
        drawerNavigable: true,
        service: Provider.of<LightService>(context),
      ),
      AppRoute(
        route: 'sensors',
        name: 'Sensors',
        screen: const SensorScreen(),
        drawerNavigable: true,
        service: Provider.of<SensorService>(context),
      ),
      AppRoute(
        route: '',
        name: 'Introduction',
        screen: const AppIntroScreen(),
        service: Provider.of<AuthService>(context),
      ),
      AppRoute(
        route: 'signIn',
        name: 'Sign In',
        screen: const SignInScreen(),
        service: Provider.of<AuthService>(context),
      ),
      AppRoute(
        route: 'signUp',
        name: 'Sign Up',
        screen: const SignUpScreen(),
        service: Provider.of<AuthService>(context),
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
