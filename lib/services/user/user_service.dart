import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minha_saude/interfaces/http/enums/request_type.dart';
import 'package:minha_saude/services/user/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api_path.dart';
import '../../interfaces/http/http_client.dart';
import '../../models/user.dart';

import 'package:http/http.dart' as http;

class UserService {
  static User? user;

  Future<User?> getUserSession() async {
    WidgetsFlutterBinding.ensureInitialized();
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

  Future<bool> authenticate(String username, String password) async {
    http.Response? response = await HttpClient.send(type: RequestType.post, url: Api.url_login, body: <String, dynamic> {
      'username': username,
      'password': password,
    });

    bool isAuth = _handleResponseAuth(response);
    if(isAuth){
      User? user = await findByEmail(username);
      await saveUserSession(user!);
    }

    return isAuth;
  }

  Future<bool> register(String name, String email, String password) async {
    http.Response? response = await HttpClient.send(type: RequestType.post, url: Api.url_register, body: <String, dynamic> {
      'nome' : name,
      'email': email,
      'senha': password,
    });

    return _handleResponse(response);
  }

  Future<User?> findByEmail(String email) async {
    http.Response? response = await HttpClient.send(type: RequestType.get, url: "${Api.url_users}/$email");

    dynamic userJson = _handleResponse(response);
    if (userJson['id'] == null) {
      return null;
    }

    var userResponse = UserResponse.fromApiJson(userJson);
    User user = User.fromResponse(userResponse);

    return user;
  }

  dynamic _handleResponse(http.Response? response) {
    if (response == null) {
      return false;
    }

    final dynamic respJson = jsonDecode(response.body);
    return respJson;
  }

  bool _handleResponseAuth(http.Response? response) {
    if (response == null) {
      return false;
    }

    final dynamic userJson = jsonDecode(response.body);
    if (userJson['access_token'] != null) {
      setToken(userJson['access_token']);
      return true;
    }

    return false;
  }

  Future<bool> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future<bool> setEmailSession(String email) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('email', email);
  }

  Future<String> getEmailSession() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    final String? userPref = prefs.getString('email');
    return userPref!;
  }
}
