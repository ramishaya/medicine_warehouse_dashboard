import 'dart:convert';

import 'package:dashboard/Core/utils/shared_preferences.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'http://127.0.0.1:8000/';

  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    var response = await _dio.get(
      '$_baseUrl$endpoint',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
     _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    var response = await _dio.post('$_baseUrl$endpoint', data: data);
    return response.data;
  }

  // Future<Map<String, dynamic>> postWithToken({
  //   required String endpoint,
  //   required Map<String, dynamic> data,
  // }) async {
  //   //_dio.options.headers['Authorization'] = 'Bearer $mytoken';
  //   _dio.options.headers['Accept'] = 'application/json';
  //   _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
  //   var response = await _dio.post('$_baseUrl$endpoint', data: data);
  //   return response.data;
  // }
}

// {
//       '_token': '79QesCqpnZT4l8aCybeEKGEdcaGNgqrLHxqqerng',
//       'username': 'Ma3rof',
//       'password': '123456789',
// }
