import 'package:dio/dio.dart';

class ApiService
{
  final Dio dio;

  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/';

  ApiService(this.dio);
  Future<List<dynamic>>get({required String endPoint}) async
  {
    Response response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}