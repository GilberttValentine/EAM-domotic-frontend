import 'dart:convert';

import 'package:eam_domotic_frontend/sensors/models/sensor.model.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';

class SensorService extends ChangeNotifier {
  final String _baseUrl = 'domoticappbackendservicestaging.onrender.com';
  final storage = const FlutterSecureStorage();
  List<Sensor> sensorList = [];

  bool isLoading = true;

  final http = InterceptedHttp.build(
    interceptors: [
      LoggedInterceptor(),
    ],
  );

  SensorService() {
    getSensors();
  }

  Future<List<Sensor>> getSensors() async {
    sensorList = [];
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, '/api/v1/sensors/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> sensorsMap = json.decode(response.body)['message'];
      for (var value in sensorsMap) {
        final tempLight = Sensor.fromJson(value);
        sensorList.add(tempLight);
      }

      isLoading = false;
      notifyListeners();

      return sensorList;
    } else {
      isLoading = false;
      notifyListeners();

      throw Exception(json.decode(response.body)['message']);
    }
  }
}
