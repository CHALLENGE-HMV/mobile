import 'package:flutter/material.dart';
import 'package:minha_saude/services/user/user_service.dart';

import 'config/routes/route_generator.dart';
import 'config/routes/routes.dart';

void main() async {
  await UserService().getUserSession().then((user) => UserService.user = user);
  runApp(MinhaSaudeApp());
}

class MinhaSaudeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Saúde',
      initialRoute: UserService.user == null ? Routes.login : Routes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
