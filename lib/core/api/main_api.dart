import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_project/helper/shared_pref_helper.dart';

class MainApi {

  String host = "https://dcc-training.herokuapp.com";
  Dio dio = Dio();

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: ""
  };

  Future<String> getRequest({
    String url,
    bool useAuth = false
  }) async {

    var apiToken = await SharedPreferencesHelper.getToken();
    if(useAuth)
      this.headers[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
    try {
      final response = await dio.get<String>(
        url,
        options: Options(
          headers: this.headers,
          validateStatus: (status) => true
        )
      );
      print("response.statusCode");
      print(response.statusCode);
      if(response.statusCode == 200) {
        return jsonEncode(jsonDecode(response.data)['data']);
      }
      else if(response.statusCode == 400 || response.statusCode == 401)
        throw jsonDecode(response.data)['message'];
      else 
        throw "Failed to load";
    } catch (error) {
      throw error;
    }

  }

  Future<String> postRequest({
    String url,
    Object body,
    bool useAuth = false,
    bool isFormData = false
  }) async {

    var apiToken = await SharedPreferencesHelper.getToken();
    if(useAuth)
      this.headers[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
    try {
      final response = await dio.post<String>(
        url,
        data: isFormData ? body : jsonEncode(body),
        options: Options(
          headers: this.headers,
          validateStatus: (status) => true,
          contentType: isFormData ? Headers.formUrlEncodedContentType : Headers.jsonContentType
        )
      );
      if(response.statusCode == 200)
        return jsonEncode(jsonDecode(response.data)['data']);
      else if(response.statusCode == 400 || response.statusCode == 401)
        throw jsonDecode(response.data)['message'];
      else 
        throw "Failed to load";
    } catch (error) {
      throw error;
    }

  }

  Future<String> patchRequest({
    String url,
    Object body,
    bool useAuth = false,
    bool isFormData = false
  }) async {

    var apiToken = await SharedPreferencesHelper.getToken();
    if(useAuth)
      this.headers[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
    try {
      final response = await dio.patch<String>(
        url,
        data: isFormData ? body : jsonEncode(body),
        options: Options(
          headers: this.headers,
          validateStatus: (status) => true,
          contentType: isFormData ? Headers.formUrlEncodedContentType : Headers.jsonContentType
        )
      );
      if(response.statusCode == 200)
        return jsonEncode(jsonDecode(response.data)['data']);
      else if(response.statusCode == 400 || response.statusCode == 401)
        throw jsonDecode(response.data)['message'];
      else 
        throw "Failed to load";
    } catch (error) {
      throw error;
    }

  }

  Future<String> deleteRequest({
    String url,
    bool useAuth = false
  }) async {

    var apiToken = await SharedPreferencesHelper.getToken();
    if(useAuth)
      this.headers[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
    try {
      final response = await dio.delete<String>(
        url,
        options: Options(
          headers: this.headers,
          validateStatus: (status) => true
        )
      );
      if(response.statusCode == 200)
        return jsonEncode(jsonDecode(response.data)['data']);
      else if(response.statusCode == 400 || response.statusCode == 401)
        throw jsonDecode(response.data)['message'];
      else 
        throw "Failed to load";
    } catch (error) {
      throw error;
    }

  }

  Future<String> putRequest({
    String url,
    bool useAuth = false
  }) async {

    var apiToken = await SharedPreferencesHelper.getToken();
    if(useAuth)
      this.headers[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
    try {
      final response = await dio.put<String>(
        url,
        options: Options(
          headers: this.headers,
          validateStatus: (status) => true
        )
      );
      if(response.statusCode == 200)
        return jsonEncode(jsonDecode(response.data)['data']);
      else if(response.statusCode == 400 || response.statusCode == 401)
        throw jsonDecode(response.data)['message'];
      else 
        throw "Failed to load";
    } catch (error) {
      throw error;
    }

  }

}