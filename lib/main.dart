import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/lights/services/light.service.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

void main() {
  io.Socket socket = io.io(
      'https://domoticappbackendservicestaging.onrender.com', <String, dynamic>{
    'autoConnect': true,
    'transports': ['websocket'],
  });

  socket.on('leds', (data) {
    debugPrint('LEDS');
    debugPrint(data.toString());
  });

  socket.on('alarms', (data) {
    debugPrint('ALARMS');
    debugPrint(data.toString());
  });

  socket.on('humidity', (data) {
    debugPrint('HUMIDITY');
    debugPrint(data.toString());
  });

  socket.on('temperature', (data) {
    debugPrint('TEMPERATURE');
    debugPrint(data.toString());
  });

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
