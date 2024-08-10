import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:film_ku/data/resources/api_routes.dart';
import 'package:http/http.dart' as http;



class ApiService {

  static Map<String,String> defaultHeaders = {
    'Authorization': 'Bearer ${ApiRoutes.apiBearer}',
  };
  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String>? headers}) async {
    try {
      print("urlll");
      print(url);
      print(defaultHeaders);
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers??defaultHeaders,
      );

      print(res.statusCode);

      if (res.statusCode == 200) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return {"Success": true, "error": null, "body": decode};
      }
      return {"Success": false, "error": jsonDecode(res.body)['status_message'], "body": null};
    } on SocketException catch (e) {
      // Handle SocketException here.
      return {
        "Success": false,
        "error": 'No Internet Connection',
        "status": 30
      };
    } on TimeoutException catch (e) {
      return {"Success": false, "error": "Request Time Out", "status": 31};
    } on HttpException catch (e) {
      return {"Success": false, "error": "Invalid Request", "status": 32};
    } catch (e) {
      rethrow;
    }
  }


}