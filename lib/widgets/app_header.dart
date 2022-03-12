import 'package:flutter/material.dart';

import 'app_footer.dart';

class AppHeader extends StatelessWidget {
  final Widget child;

  AppHeader({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_app.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        ),
        extendBody: true,
        bottomNavigationBar: AppFooter(),
      ),
    );
  }
}
