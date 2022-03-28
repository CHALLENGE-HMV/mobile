import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';

class LeadingLogo extends StatelessWidget {
  final bool register;

  const LeadingLogo({Key? key, this.register=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          if (register)
            Navigator.of(context).pushNamed(Routes.login);
          else
            Navigator.of(context).pushNamed(Routes.home);
        },
        child: Container(
          padding: EdgeInsets.all(50),
          child: Image(
            height: 70,
            image: AssetImage("assets/images/logo_app.png"),
          ),
        ),
      ),
    );
  }
}
