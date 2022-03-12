import 'package:flutter/material.dart';

import 'config/routes/route_generator.dart';
import 'config/routes/routes.dart';

void main() {
  runApp(MinhaSaudeApp());
}

class MinhaSaudeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Saúde',
      initialRoute: Routes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
