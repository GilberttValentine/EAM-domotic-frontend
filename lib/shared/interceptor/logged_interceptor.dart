import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggedInterceptor implements InterceptorContract {
  final storage = const FlutterSecureStorage();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final token = await storage.read(key: 'token');

    data.headers['Content-Type'] = 'application/json; charset=UTF-8';
    data.headers['Authorization'] = 'Bearer $token';

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
