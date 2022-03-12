import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

class RemediosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingLogo(),
          TextWithUnderline(text: "Remédios"),
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
                BulletItem(text: "Diazepan - 1 dose à cada 8 horas"),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: AppText(
                    text: "Próximo horário: 25/06/2022 12:00",
                    color: AppColors.orange,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                BulletItem(text: "Diclonefaco - 2x ao dia."),
                SizedBox(height: 10),
                Center(
                  child: AppText(
                    text: "Próximo horário: 25/06/2022 12:00",
                    color: AppColors.orange,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(height: 180),
          MeusPontos()
        ],
      ),
    );
  }
}
