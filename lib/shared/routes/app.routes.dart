import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/notifications/screens/notification.screen.dart';
import 'package:eam_domotic_frontend/sensors/screens/sensor.screen.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'lights';
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
    /* AppRoute(
      route: 'log-in',
      name: 'Log-in',
      screen: screen,
    ),
    AppRoute(
      route: 'Log-out',
      name: 'Log-out',
      screen: screen,
    ), */
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final route in routes) {
      appRoutes.addAll({route.route: (BuildContext context) => route.screen});
    }

    return appRoutes;
  }
}
