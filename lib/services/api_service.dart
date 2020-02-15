import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:news_app/models/cb_network_error.dart';

String apiKey = '7ab7955b394c4fcfb2b54d5142cddd94';
String baseUrl = 'https://newsapi.org/v2';

abstract class APIService {
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic> params,
      bool useCookieHeaders = true,
      type = RequestType.JSON}) async {
    try {
      var data = await http.get(_getUrlWithParams(url, params: params),
          headers: await _getHeaders(useCookieHeaders: useCookieHeaders));
      return _getResponse(data, url);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> post(String url,
      {@required Map<String, dynamic> body,
      bool useCookieHeaders = true,
      type = RequestType.JSON}) async {
    final response = await http.post(_getUrl(url),
        body: type == RequestType.FORM ? body : json.encode(body),
        headers:
            await _getHeaders(useCookieHeaders: useCookieHeaders, type: type));
    return _getResponse(response, url);
  }

  Future<Map<String, dynamic>> put(String url,
      {@required Map<String, dynamic> body,
      bool useCookieHeaders = true,
      type = RequestType.JSON}) async {
    final response = await http.put(_getUrl(url),
        body: type == RequestType.FORM ? body : json.encode(body),
        headers:
            await _getHeaders(useCookieHeaders: useCookieHeaders, type: type));
    return _getResponse(response, url);
  }

  // Helper Methods for API Services
  String _getUrl(String url) {
    return baseUrl + url;
  }

  Future<Map<String, String>> _getHeaders(
      {bool useCookieHeaders = true, type = RequestType.JSON}) async {
    Map<String, String> map = Map();
    try {
      if (type == RequestType.JSON) {
        map['Content-Type'] = 'application/json';
      } else {
        map['Content-Type'] = 'application/x-www-form-urlencoded';
      }
//    if(useCookieHeaders){
//      map['&apiKey=$apiKey']
//    }
    } catch (e) {
      throw e;
    }
    return map;
  }

  String _getUrlWithParams(String url, {Map<String, dynamic> params}) {
    var absUrl = _getUrl(url);
    try {
      if (params != null) {
        var paramsString = '';
        params.forEach((key, value) {
          paramsString += '&$key=$value';
        });

        return absUrl + '?' + paramsString.substring(1) + '&apiKey=${apiKey}';
      }
    } catch (e) {
      throw e;
    }
    return absUrl;
  }

  Map<String, dynamic> _getResponse(http.Response response, String url) {
    print("api service");
    print(response.statusCode.toString());
    print(response.body.toString());
    print(response.request.url.toString());

    if (response.statusCode == 204 || response.body.isEmpty) return null;

    try {
      final Map<String, dynamic> body = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        body['cookie'] = response.headers['set-cookie'];
        return body;
      } else {
        throw CbNetworkError.fromJson(body);
      }
    } catch (e) {
      throw e;
    }
  }
}

enum RequestType { JSON, FORM }
