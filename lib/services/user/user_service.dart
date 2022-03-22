import 'dart:convert';

import 'package:minha_saude/services/user/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class UserService {
  Future<User?> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userPref = prefs.getString('user');

    if (userPref == null) {
      return null;
    }

    final dynamic userJson = jsonDecode(userPref);

    var userResponse = UserResponse.fromJson(userJson);
    return User.fromResponse(userResponse);
  }

  Future<bool> saveUserSession(User user) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', jsonEncode(user));
  }

  Future<void> authenticate(String username, String password) async {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  Future<bool> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }
}
