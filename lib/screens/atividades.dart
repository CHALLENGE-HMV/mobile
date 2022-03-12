import 'package:flutter/material.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

class AtividadesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingLogo(),
          TextWithUnderline(text: "Atividades"),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "Ginástica"),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "Natação"),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "Pilates"),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "Corrida"),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "Ciclismo"),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(height: 190),
          MeusPontos()
        ],
      ),
    );
  }

}