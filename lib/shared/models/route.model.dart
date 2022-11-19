import 'package:flutter/material.dart';

class AppRoute {
  final String route;
  final String name;
  final Widget screen;
  final bool drawerNavigable;

  AppRoute({
    required this.route,
    required this.name,
    required this.screen,
    this.drawerNavigable = false,
  });
}
