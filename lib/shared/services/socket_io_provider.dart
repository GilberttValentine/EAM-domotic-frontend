import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  io.Socket socket = io.io(
      'https://domoticappbackendservicestaging.onrender.com', <String, dynamic>{
    'autoConnect': true,
    'transports': ['websocket'],
  });

  getLights() {
    socket.on('leds', (data) {
      debugPrint('LEDS');
      debugPrint(data.toString());

      return data;
    });
  }

  pushNotification() {
    socket.on('alarms', (data) {
      debugPrint('ALARMS');
      debugPrint(data.toString());

      return data;
    });
  }

  getHumidity() {
    socket.on('humidity', (data) {
      debugPrint('HUMIDITY');
      debugPrint(data.toString());

      return data;
    });
  }

  getTemperature() {
    socket.on('temperature', (data) {
      debugPrint('TEMPERATURE');
      debugPrint(data.toString());

      return data;
    });
  }
}
