import 'dart:convert';

import 'package:transisi/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<AuthModel> login(String? email, String? password) async {
    Uri uri = Uri.parse("https://reqres.in/api/login");

    var response = await http.post(
      uri,
      body: {
        'email': email,
        'password': password,
      },
    );

    final result = json.decode(response.body);

    return AuthModel(token: result['token']);
  }
}
