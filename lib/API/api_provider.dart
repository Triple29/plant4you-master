import 'package:http/http.dart' as http;
import 'dart:async';

class ApiProvider {
  ApiProvider();

  String endPoint = 'http://127.0.0.1:3000';

  Future<http.Response> doLogin(String email, String password) async {
    Uri _url = Uri.parse('$endPoint/user/login');
    var body = {"email": email, "password": password};

    return http.post(_url, body: body);
  }
}
