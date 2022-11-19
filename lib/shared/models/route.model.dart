import 'package:flutter/material.dart';

class AppRoute {
  final String route;
  final String name;
  final Widget screen;
  final bool drawerNavigable;
  final ChangeNotifier service;

  AppRoute({
    required this.route,
    required this.name,
    required this.screen,
    this.drawerNavigable = false,
    required this.service,
  });
}
