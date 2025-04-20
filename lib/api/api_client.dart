import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_app/api/api_checker.dart';
import 'package:ecommerce_app/common/models/error_response.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetxService {
  final String appbaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = "connection_to_api_server_failed".tr;
  final int timeoutInSeconds = 40;

  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appbaseUrl,
    required this.sharedPreferences,
  }) {
    token = sharedPreferences.getString(AppConstants.token);
    if (kDebugMode) {
      print("Token : $token");
    }
    updateHeader(
      token,
      sharedPreferences.getString(AppConstants.languageCode),
    );
  }

  Map<String, String> updateHeader(String? token, String? languageCode,
      {bool setHeader = true}) {
    Map<String, String> header = {};
    header.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    if (setHeader) {
      _mainHeaders = header;
    }
    return header;
  }

  /// Helper Method to make a Get Request
  // static Future<Map<String, dynamic>> getData(String endpoint) async {
  //   final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
  //   return _handleResponse(response);
  // }

  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
      }
      http.Response response = await http
          .get(Uri.parse(appbaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      if (kDebugMode) {
        print('------------${e.toString()}');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  /// Helper Method to make a Post Request
  // static Future<Map<String, dynamic>> postData(
  //     String endpoint, dynamic data) async {
  //   final response = await http.post(
  //     Uri.parse('$_baseUrl/$endpoint'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(data),
  //   );

  //   return _handleResponse(response);
  // }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers,
      int? timeout,
      bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }
      http.Response response = await http
          .post(Uri.parse(appbaseUrl + uri),
              body: jsonEncode(body), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeout ?? timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  /// Helper Method to make a PostMultiple Request
  Future<Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body with ${multipartBody.length} picture');
      }
      //Create a new Post Request with URI
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(appbaseUrl + uri));

      //Add Header with Content Type and Aurthorization
      request.headers.addAll(headers ?? _mainHeaders);

      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          //Reads the entire file as a sequence of bytes (binary data).
          //Uint8List is a list of unsigned 8-bit integers → perfect for storing raw file data.
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(
            http.MultipartFile(
              //Type of file or field name
              multipart.key,
              //reads the entire file as binary data and convert into stream
              //Streams allow the data to be sent in chunks, not loaded all into memory.
              //work better with streams for performance and memory.
              multipart.file!.readAsBytes().asStream(),
              //File Size
              list.length,
              filename: '${DateTime.december.toString()}.png',
            ),
          );
        }
      }
      //adding only body (not file included)
      request.fields.addAll(body);
      //Sends the multipart request
      http.Response response =
          await http.Response.fromStream(await request.send());
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  /// Helper Method to make a Put Request
  // static Future<Map<String, dynamic>> putData(
  //     String endpoint, dynamic data) async {
  //   final response = await http.put(
  //     Uri.parse('$_baseUrl/$endpoint'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(data),
  //   );
  //   return _handleResponse(response);
  // }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body');
      }
      http.Response response = await http
          .put(
            Uri.parse(appbaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  /// Helper Method to make a Put Multiple Request
  Future<Response> putMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
        print('====> API Body: $body with ${multipartBody.length} picture');
      }
      http.MultipartRequest request =
          http.MultipartRequest('PUT', Uri.parse(appbaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(multipart.key,
              multipart.file!.readAsBytes().asStream(), list.length,
              filename: '${DateTime.now().toString()}.png'));
        }
      }
      request.fields.addAll(body);
      http.Response response =
          await http.Response.fromStream(await request.send());
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  /// Helper Method to make a Delete Request
  // static Future<Map<String, dynamic>> deleteData(String endpoint) async {
  //   final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
  //   return _handleResponse(response);
  // }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nHeader: ${headers ?? _mainHeaders}');
      }
      http.Response response = await http
          .delete(Uri.parse(appbaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  /// Handel HTTP Response
  // static Map<String, dynamic> _handleResponse(http.Response response) {
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load data : ${response.statusCode}');
  //   }
  // }

  Response handleResponse(
      http.Response response, String uri, bool handleError) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
        headers: response.request!.headers,
        method: response.request!.method,
        url: response.request!.url,
      ),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode == 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{errors : [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: errorResponse.errors![0].message,
        );
      } else if (response0.toString().startsWith("{message")) {
        response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: response0.body['message'],
        );
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }
    if (kDebugMode) {
      print('====> API Response: [${response0.statusCode}] $uri');
    }
    if (handleError) {
      if (response0.statusCode == 200) {
        return response0;
      } else {
        ApiChecker.checkApi(response0);
        return const Response();
      }
    } else {
      return response0;
    }
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}
