import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/services/user/user_service.dart';

import '../widgets/app_header.dart';
import '../widgets/leading_logo.dart';
import '../widgets/text_with_under_line.dart';

class RegistroPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      register: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingLogo(),
          TextWithUnderline(text: "Registre-se"),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                    left: 40,
                  ),
                  child: Text(
                    "Nome:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  controller: _nomeController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preenchimento obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                    left: 40,
                  ),
                  child: Text(
                    "E-mail:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preenchimento obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                    left: 40,
                  ),
                  child: Text(
                    "Senha:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _senhaController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Preenchimento obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: 170,
                  child: FloatingActionButton(
                    onPressed: () {
                      _userService
                          .register(_nomeController.text, _emailController.text,
                              _senhaController.text)
                          .then((success) => {
                                if (success)
                                  Navigator.of(context).pushNamed(Routes.home)
                                else
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title:
                                                Text("Falha ao se registrar"),
                                            content: Text(
                                                "Ocorreu um erro ao se registrar"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, "OK"),
                                                  child: Text("OK"))
                                            ],
                                          )).whenComplete(() =>
                                      Navigator.of(context)
                                          .pushNamed(Routes.registro))
                              });
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Text(
                      "Registrar",
                      style: TextStyle(fontSize: AppFontSize.big),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
