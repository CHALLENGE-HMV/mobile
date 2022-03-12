import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';
import 'package:minha_saude/constants/app_constants.dart';

import 'app_text.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _FooterButton(caption: "Consultas", route: Routes.consultas,),
            _FooterButton(caption: "Remédios", route: Routes.remedios),
            _FooterButton(caption: "Atividades", route: Routes.atividades),
          ],
        ), //or row of buttons
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent, //background color
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  final String caption;
  final String route;
  
  _FooterButton({Key? key, required this.caption, required this.route}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      elevation: 2.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      fillColor: AppColors.buttonBlue,
      child: Column(
        children: [
          Spacer(),
          Expanded(
              child: Icon(
                Icons.directions_bike,
                color: Colors.white,
              )),
          Spacer(),
          Expanded(
              child: AppText(
                text: caption,
                color: Colors.white,
              )),
          Spacer(),
        ],
      ),
      constraints: BoxConstraints.tightFor(width: 110, height: 80),
    );
  }
  
}