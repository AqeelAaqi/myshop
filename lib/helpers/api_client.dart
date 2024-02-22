import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> getData() async {
    try {
      final response = await _dio.get(
        'https://reqres.in/api/users?page=2',
      );
      return response;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // rethrow the error for handling in DataProvider
    }
  }
}
