import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';

class LeadingLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
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
