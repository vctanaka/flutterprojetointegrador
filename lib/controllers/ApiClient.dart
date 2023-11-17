import 'package:http/http.dart' as http;

class ApiClient {
  Future<dynamic> fetch(String urlFetch, Object? bodyFetch) async {
    var url = Uri.http('localhost:8000', 'api/' + urlFetch);
    var response = await http.post(url, body: bodyFetch);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
  }
}
