import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

import '../../lights/light.module.dart';

class AppRoutes {
  static const initialRoute = 'lights';
  static final routes = <AppRoute>[
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
