import 'dart:convert';

import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LightService extends ChangeNotifier {
  final String _baseUrl = 'domoticappbackendservicestaging.onrender.com';
  final storage = const FlutterSecureStorage();
  List<Led> lights = [];

  bool isLoading = true;

  final http = InterceptedHttp.build(
    interceptors: [
      LoggedInterceptor(),
    ],
  );

  LightService() {
    getLights();
  }

  Future<List<Led>> getLights() async {
    lights = [];
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, '/api/v1/leds/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> lightsMap = json.decode(response.body)['message'];
      for (var value in lightsMap) {
        final tempLight = Led.fromJson(value);
        lights.add(tempLight);
      }

      isLoading = false;
      notifyListeners();

      return lights;
    } else {
      isLoading = false;
      notifyListeners();

      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<String> updateLightLocation(Location location) async {
    final Map<String, dynamic> locationBody = {
      'locations': location,
    };

    final url = Uri.https(_baseUrl, '/api/v1/locations/name');

    final response = await http.patch(url, body: json.encode(locationBody));

    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<String> updateLightState(String id, bool state) async {
    final Map<String, dynamic> body = {
      'led': {
        'id': id,
        'on': state,
      },
    };

    final url = Uri.https(_baseUrl, '/api/v1/leds/state');

    final response = await http.patch(url, body: json.encode(body));

    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
}
