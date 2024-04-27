import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  static const String baseUrl = 'http://192.168.1.104:9000/api';

  ApiClient() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 5000; // 5 seconds
    _dio.options.receiveTimeout = 5000; // 5 seconds
  }

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
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
