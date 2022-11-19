import 'dart:convert';

import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http/http.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'domoticappbackendservicestaging.onrender.com';

  final storage = const FlutterSecureStorage();

  final http = InterceptedHttp.build(interceptors: [
    UnloggedInterceptor(),
  ]);

  Future<String?> registerUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'user': {
        'username': email,
        'password': password,
      }
    };

    final url = Uri.https(_baseUrl, '/api/v1/users');

    final response = await http.post(url, body: json.encode(authData));

    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<String?> loginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'username': email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/api/v1/users/login');

    final response = await http.post(url, body: json.encode(authData));

    if (response.statusCode == 200) {
      final decodeBody = json.decode(response.body)['message'];

      await storage.write(key: 'token', value: decodeBody['token']);
      await storage.write(key: 'username', value: decodeBody['username']);

      return decodeBody['username'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<bool> validateCurrentToken() async {
    final token = await readToken();

    final Map<String, dynamic> authData = {
      'token': token,
    };

    final url = Uri.https(_baseUrl, '/api/v1/users/validate');

    final response = await http.post(url, body: json.encode(authData));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future logout() async {
    await storage.deleteAll();
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<String> readUsername() async {
    return await storage.read(key: 'username') ?? '';
  }
}
