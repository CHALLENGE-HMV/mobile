import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';
import 'package:minha_saude/screens/atividades.dart';
import 'package:minha_saude/screens/beneficios.dart';
import 'package:minha_saude/screens/consultas.dart';
import 'package:minha_saude/screens/home.dart';
import 'package:minha_saude/screens/login.dart';
import 'package:minha_saude/screens/remedios.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case Routes.beneficios:
        return MaterialPageRoute(builder: (context) => BeneficiosPage());
      case Routes.consultas:
        return MaterialPageRoute(builder: (context) => ConsultasPage());
      case Routes.remedios:
        return MaterialPageRoute(builder: (context) => RemediosPage());
      case Routes.atividades:
        return MaterialPageRoute(builder: (context) => AtividadesPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}