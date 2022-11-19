import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService extends ChangeNotifier {
  io.Socket socket = io.io(
      'https://domoticappbackendservicestaging.onrender.com', <String, dynamic>{
    'autoConnect': true,
    'transports': ['websocket'],
  });

  var alarm = {};

  getLights(LightService lightService) {
    socket.on('leds', (data) {
      lightService.listDynamicToListLeds(data);
      notifyListeners();
    });
  }

  pushNotification(NotificationService notificationService) {
    socket.on('alarms', (data) {
      notificationService.newNotifications = true;
      notifyListeners();
    });
  }

  getHumidity(SensorService sensorService) {
    socket.on('humidity', (data) {
      sensorService.sensorList[0].getSensorState.setHumidity = data;
      notifyListeners();
    });
  }

  getTemperature(SensorService sensorService) {
    socket.on('temperature', (data) {
      sensorService.sensorList[0].getSensorState.setTemperature = data;
      notifyListeners();
    });
  }
}
