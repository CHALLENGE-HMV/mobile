import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';
import 'package:minha_saude/constants/api_path.dart';
import 'package:minha_saude/services/user/user_service.dart';
import 'package:minha_saude/widgets/app_icons.dart';

class LoginPage extends StatelessWidget {
  final UserService _userService = UserService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: MainWidget(),
        ),
        bottomNavigationBar: BottomButtonsBar()
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover)),
      padding: EdgeInsets.only(top: 50.0),
      child: SingleChildScrollView(
        child: Column(
          children: [LogoHMV(), LogoApp(), ContainerIdentifyForm()],
        ),
      ),
    );
  }
}

class ContainerIdentifyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 110.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          BoxIdentifyLabel(),
          BoxEditFields()
        ],
      ),
    );
  }
}

class BoxIdentifyLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class BoxEditFields extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

class LogoHMV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/logo_hospital.png'),
      width: 150,
    );
  }
}

class LogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 100),
      child: Image(
        image: AssetImage('assets/images/logo_app.png'),
        width: 250,
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {

  final UserService _userService = UserService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _onPressed_Login(BuildContext context){
    _userService
        .authenticate(_emailController.text, _senhaController.text)
        .then((auth) {
      if (auth) {
        Navigator.of(context).pushNamed(Routes.home);
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Falha ao se autenticar"),
              content: Text("E-mail ou senha inválidos"),
              actions: [
                TextButton(
                    onPressed: () =>
                        Navigator.pop(context, "OK"),
                    child: Text("OK"))
              ],
            )).whenComplete(
                () => Navigator.of(context).pushNamed(Routes.login));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 150,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: ElevatedButton(
          onPressed: () => { _onPressed_Login(context) },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(AppIcons.user_check),
                Text("Entrar"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: 150,
        child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.registro),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage('assets/images/register_icon.png')),
                  Text("Registrar"),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class BottomButtonsBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonLogin(),
            ButtonRegister()
          ],
        ),
      ),
      color: Colors.grey,
    );
  }
}
