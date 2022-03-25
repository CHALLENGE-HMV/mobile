import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import '../widgets/leading_logo.dart';
import '../widgets/text_with_under_line.dart';

class RegistroPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AppHeader(
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
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
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
                  style: TextStyle(color: Colors.white),
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
                  style: TextStyle(color: Colors.white),
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
            ],
          ),
          SizedBox(height: 180),
        ],
      ),
    );
  }
}
