import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final Dio _dio = Dio();
  static const String baseUrl = 'http://192.168.1.77:9000/api';
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  ApiClient() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 5000; // 5 seconds
    _dio.options.receiveTimeout = 5000; // 5 seconds
    //token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var token = await storage.read(key: 'token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
  }
        return handler.next(options);
      },
    ));
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
    print('Token saved: $token');
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      print('Response: $response');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Map<String, dynamic>> postData(String endpoint,
      Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        throw e.response!.data;
      } else {
        throw Exception('Failed to post data: $e');
      }
    }
  }
}
