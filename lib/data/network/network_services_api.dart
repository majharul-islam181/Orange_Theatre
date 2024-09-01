// ignore_for_file: constant_pattern_never_matches_value_type
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:orange_theatre/data/network/base_api_services.dart';
import '../exceptions/app_exceptions.dart';

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url, {String? apiKey}) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url),
          
        // headers: apiKey != null ? {'Authorization': apiKey} : {},
          
          ).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data, {String? token}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic jsonResponse;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data ?? {}),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> delete(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(
            Uri.parse(''),
          )
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    switch (response.statusCode) {
      case 200:
        // Handle successful responses
        // if (response.body.isNotEmpty) {
        //   return jsonDecode(response.body) as Map<String, dynamic>;
        // } else {
        //   return {}; // Return an empty map if the body is empty
        // }
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 201:
        // Handle successful responses
        // if (response.body.isNotEmpty) {
        //   return jsonDecode(response.body) as Map<String, dynamic>;
        // } else {
        //   return {}; // Return an empty map if the body is empty
        // }
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        // return jsonDecode(response.body) as Map<String, dynamic>;
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 404:
        // return jsonDecode(response.body) as Map<String, dynamic>;
        var jsonResponse = jsonDecode(response.body);
        throw UnauthorisedException(
            jsonResponse['message'] ?? 'Unauthorized request');

      case 401:
        // throw UnauthorisedException();
        var jsonResponse = jsonDecode(response.body);
        throw UnauthorisedException(
            jsonResponse['message'] ?? 'Unauthorized request');
      case 500:
        throw FetchDataException(
            'Error communicating with server${response.statusCode}');
      // case 500:
      //   throw FetchDataException(
      //       '${response.statusCode}');
      default:
        throw FetchDataException('Unexpected error :  ${response.statusCode}');
    }
  }
}
