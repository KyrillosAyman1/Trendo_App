import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
     List<dynamic> jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonData;
    
      
    } else {
      throw Exception(
        'there is a problem with status code: ${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there is a problem with status code: ${response.statusCode} with body: ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
      // ignore: avoid_print
      print('PUT Request to $url with body: $body and headers: $headers');
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
       Map<String, dynamic> data = json.decode(response.body);
       // ignore: avoid_print
       print('PUT Response Data: $data');
      return data;
      
    } else {
      throw Exception(
        'there is a problem with status code: ${response.statusCode} with body: ${jsonDecode(response.body)}',
      );
    }
  }
}
