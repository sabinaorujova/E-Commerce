import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/auth_response.dart';
import '../../utils/constants/end_points.dart';

class RegisterService {
  Future<AuthResponse?> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final Uri url = Uri.parse(EndPoints.registerLive);
    final body = {"full_name": fullName, "email": email, "password": password};

    final http.Response response = await http.post(url, body: body);
    if (response.statusCode > 199 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      return AuthResponse.fromJson(data);
    }
    return null;
  }
}
