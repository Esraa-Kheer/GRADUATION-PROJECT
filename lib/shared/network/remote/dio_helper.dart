import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://bakr-app.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
        }
      )
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String? token,
    String? id,
})async
  {
    return await dio.get(url,queryParameters:query );
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
     required Map<String,dynamic>data,
      String? token
})async{
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

}