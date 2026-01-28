import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/';

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }



  Future<List<dynamic>> getProductByCategory({required String endPoint , required int id}) async {
    Response response = await _dio.get('$_baseUrl${endPoint}id=$id');
    return response.data;
  }

  Future<Map<String ,dynamic>>post({required String endPoint , required Map<String , dynamic>data}) async {
    Response response = await _dio.post('$_baseUrl$endPoint' , data: data);
    return response.data;
  }
}
