import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';
import 'package:minha_saude/services/user/user_service.dart';
import 'package:minha_saude/widgets/app_icons.dart';

class LoginPage extends StatelessWidget {
  final UserService _userService = UserService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 7,
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo_hospital.png'),
                    width: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child:
                        Image(image: AssetImage('assets/images/logo_app.png')),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text.rich(TextSpan(
                                children: [
                                  WidgetSpan(child: Icon(Icons.fingerprint)),
                                  TextSpan(
                                    text: "Por favor identifique-se",
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
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
                                  "Usuário:",
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
                        Column(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(
                  top: BorderSide(
                    color: Colors.orange,
                    width: 5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => {
                        _userService
                            .authenticate(
                                _emailController.text, _senhaController.text)
                            .then((auth) {
                          if (auth) {
                            Navigator.of(context).pushNamed(Routes.home);
                          } else {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: Text("Falha ao se autenticar"),
                              content: Text("E-mail ou senha inválidos"),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context, "OK"), child: Text("OK"))
                              ],
                            )).whenComplete(() => Navigator.of(context).pushNamed(Routes.login));
                          }
                        })
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(AppIcons.user_check),
                          Text("Entrar"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(Routes.registro),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/images/register_icon.png')),
                          Text("Registrar"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
