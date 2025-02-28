import 'package:dio/dio.dart';

class WebService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://blog.novadev.ir/api",
      headers: {
        "Content-Type" : "application/json",
        "Accept" : "application/json"
      },
      validateStatus: (status) => status! < 500,
    )
  );


  Future<Response> getRequest({required String endPoint,Map<String,dynamic>? params,String? token}) async {
    if(token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }
    final response = await dio.get(endPoint,queryParameters: params);
    return response;
  }


  Future<Response> postRequest({required String endPoint,Map<String,dynamic>? body,FormData? formData,String? token}) async {
    if(token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }

    if(body != null && formData != null) {
      throw Exception("You cant provide both body  and formData");
    }

    final response = await dio.post(endPoint,data: body ?? formData);
    return response;
  }

  Future<Response> puttRequest({required String endPoint,Map<String,dynamic>? body,FormData? formData,String? token}) async {
    if(token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }

    if(body != null && formData != null) {
      throw Exception("You cant provide both body  and formData");
    }

    final response = await dio.put(endPoint,data: body);
    return response;
  }

  Future<Response> deleteRequest({required String endPoint,String? token}) async {
    if(token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }
    final response = await dio.delete(endPoint);
    return response;
  }


}