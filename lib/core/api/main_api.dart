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