import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/lights/services/light.service.dart';
import 'package:eam_domotic_frontend/notifications/services/notification.service.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';
import 'package:eam_domotic_frontend/shared/services/socket_io_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => LightService()),
        ChangeNotifierProvider(create: (_) => SensorService()),
        ChangeNotifierProvider(create: (_) => NotificationService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Domotic App',
        initialRoute: appRoutes.initialRoute,
        routes: appRoutes.getAppRoutes(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
