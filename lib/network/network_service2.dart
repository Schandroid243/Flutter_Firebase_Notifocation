import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'network_helper.dart';

enum RequestType { get, put, post }

class NetworkService2 {
  const NetworkService2._();

  static Map<String, String> _getHeaders() => {
        'Content-Type': 'application/json; charset=utf-8',
      };

  static Future<http.Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    String? postBody,
  }) {
    if (requestType == RequestType.get) {
      return http.get(uri, headers: headers);
    }
    if (requestType == RequestType.post) {
      return http.post(uri, headers: headers, body: postBody);
    }
    return null;
  }

  static Future<http.Response>? _createPostRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    String? body,
  }) {
    if (requestType == RequestType.get) {
      return http.get(uri, headers: headers);
    }
    if (requestType == RequestType.post) {
      return http.post(uri, headers: headers, body: body);
    }
    return null;
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    String? postBody,
    Map<String, String>? queryParam,
  }) async {
    try {
      final _header = _getHeaders();
      final _url = NetworkHelper.concatUrlQP(url, queryParam);

      final response = await _createRequest(
        requestType: requestType,
        uri: Uri.parse(_url),
        headers: _header,
        body: body,
      );
      var value = utf8.decode(response!.bodyBytes);

      return response;
    } catch (e) {
      debugPrint('Error - $e');
      return null;
    }
  }

  static Future<http.Response?>? sendPostRequest({
    required RequestType requestType,
    required String urL,
    String? body,
    String? postBody,
    Map<String, String>? queryParam,
  }) async {
    try {
      final header = _getHeaders();
      final url = NetworkHelper.concatUrlQP(urL, queryParam);

      final response = await _createPostRequest(
        requestType: requestType,
        uri: Uri.parse(url),
        headers: header,
        body: postBody,
      );

      return response;
    } catch (e) {
      debugPrint('Error - $e');
      return null;
    }
  }
}
