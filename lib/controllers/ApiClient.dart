import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skin_saga/controllers/Tools.dart';

class ApiClient {
  Future<dynamic> fetchAuth(String urlFetch, Object? bodyFetch) async {
    var url = Uri.http('localhost:8000', 'api/' + urlFetch);
    var token = await Tools().getToken();
    var response = await http.post(url,
        body: bodyFetch, headers: {'Authorization': 'Bearer ' + token});

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    return response;
  }

  Future<dynamic> fetch(String urlFetch, Object? bodyFetch) async {
    var url = Uri.http('localhost:8000', 'api/' + urlFetch);
    var response = await http.post(url, body: bodyFetch);

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    return response;
  }

  Future<List<dynamic>> getApiBuild(String url) async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth(url, {
      'id': id.toString(),
    });
    var respDecode = json.decode(response.body);

    // print("xxxt" + respDecode.toString());

    return respDecode;
  }
}
