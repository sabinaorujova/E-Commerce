import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/auth_response.dart';
import '../../utils/constants/end_points.dart';

class LoginService {
  Future<AuthResponse?> login(
      {required String email, required String password}) async {
    final Uri loginUri = Uri.parse(EndPoints.loginLive);
    final body = {
      "email": email,
      "password": password,
    };
    final http.Response response = await http.post(loginUri, body: body);

    if (response.statusCode > 199 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      return AuthResponse.fromJson(data);
    } 
      return null;
  }
}
