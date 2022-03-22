import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:minha_saude/models/user.dart';
import 'package:minha_saude/services/user/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test("User_Session_When_Exists_Should_ReturnUser", () async {
    //arrange
    var user = new User(
        id: '54495ad94c934721ede76d90',
        email: 'cliente@moinhos.com.br',
        name: 'Jose Paciente',
        register: "NS-555");

    Map<String, String> values = <String, String>{'user': jsonEncode(user)};
    SharedPreferences.setMockInitialValues(values);

    UserService userService = new UserService();
    User? userSession;

    //act
    userSession = await userService.getUserSession();

    //assert
    expect(userSession?.id, user.id);
  });
  
  test("User_Session_When_NOTExists_Should_ReturnNull", () async {
    //arrange
    UserService userService = new UserService();
    User? userSession;

    //act
    userSession = await userService.getUserSession();

    //assert
    expect(userSession, null);
  });
}
