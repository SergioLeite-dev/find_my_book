import 'package:dio/dio.dart';

class ClientHttp {
  final dio = Dio();

  Future<Map<String, dynamic>> get(String path, Map<String, dynamic> params) async {
    final response = await dio.get(path, queryParameters: params);
    return response.data;
  }
}
