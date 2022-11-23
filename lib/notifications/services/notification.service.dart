import 'dart:convert';

import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/interceptor/logged_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http/http.dart';

class NotificationService extends ChangeNotifier {
  List<NotificationApp> notifications = [];
  var newNotifications = false;

  final String _baseUrl = 'domoticappbackendservicestaging.onrender.com';
  final storage = const FlutterSecureStorage();

  bool isLoading = true;

  final http = InterceptedHttp.build(
    interceptors: [
      LoggedInterceptor(),
    ],
  );

  NotificationService() {
    getNotifications();
  }

  Future<List<NotificationApp>> getNotifications() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, '/api/v1/alarms/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      listDynamicToListLeds(json.decode(response.body)['message']);
      isLoading = false;
      notifyListeners();

      return notifications;
    } else {
      isLoading = false;
      notifyListeners();

      throw Exception(json.decode(response.body)['message']);
    }
  }

  listDynamicToListLeds(List<dynamic> lightsMap) {
    notifications = [];
    for (var value in lightsMap) {
      final tempNotification = NotificationApp.fromJson(value);
      notifications.add(tempNotification);
    }
  }

  Future<bool> deleteAlarm(int index) async {
    final url = Uri.https(_baseUrl, '/api/v1/alarms');

    final Map<String, dynamic> notification = {
      'id': notifications[index].getId
    };

    final response = await http.delete(url, body: json.encode(notification));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
