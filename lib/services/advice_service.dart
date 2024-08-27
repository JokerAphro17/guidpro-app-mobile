import 'package:dio/dio.dart';
import 'package:guidpro_mobile/api/client.dart';
import 'package:guidpro_mobile/models/article.dart';

class AdviceService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Advice>> fetchPublishedAdvices() async {
    try {
      final response = await _apiClient.fetchData('/advices/published?search=''');
      print('Advices response: $response');
      if (response['success'] == true) {
        List jsonResponse = response.containsKey('data') ? response['data'] : [];
        return jsonResponse.map((data) => Advice.fromJson(data)).toList();
      } else {
        throw Exception('Fai to load advices');
      }
    } catch (e) {
      throw Exception('Failed to load advices: $e');
    }
  }

  Future<List<Advice>> searchAdvices(String query) async {
    try {
      final response = await _apiClient.fetchData('/advices/published?search=$query');
      print('Advices response: $response');
      if (response['success'] == true) {
        List jsonResponse = response.containsKey('data') ? response['data'] : [];
        return jsonResponse.map((data) => Advice.fromJson(data)).toList();
      } else {
        throw Exception('Fai to load advices');
      }
    } catch (e) {
      throw Exception('Failed to load advices: $e');
    }
  }
}
