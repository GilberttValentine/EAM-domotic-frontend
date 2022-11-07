import 'dart:convert';

import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LightService extends ChangeNotifier {
  final String _baseUrl = 'domoticappbackendservicedevelopment.onrender.com';

  final storage = const FlutterSecureStorage();

  final http = InterceptedHttp.build(interceptors: [
    LoggedInterceptor(),
  ]);

  Future<List<dynamic>> getAllSensors() async {
    final url = Uri.https(_baseUrl, '/api/v1/sensors/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
}
