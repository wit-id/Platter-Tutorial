import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_flutter/models/login/login_request.dart';
import 'package:test_flutter/models/login/login_response.dart';

//URL
const _baseUrl = 'https://antidote-299004.et.r.appspot.com/v1';

//ENDPOINTS
const String _postLogin = '/auth/login';

//CLIENT
Client client = Client();
Map<String, String> _requestHeader = {'Content-Type': 'application/json'};

//AUTHENTICATION START
abstract class LoginRepo {
  Future<LoginResponse> login(LoginRequest request);
}

class LoginServices implements LoginRepo {
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final req = jsonEncode(request.toJson());

    final response = await client.post(
      _baseUrl + _postLogin,
      headers: _requestHeader,
      body: req,
    );

    LoginResponse data = loginResponseFromJson(response.body);

    return data;
  }
}
//AUTHENTICATION END
