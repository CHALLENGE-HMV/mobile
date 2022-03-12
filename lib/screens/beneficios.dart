import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

class BeneficiosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingLogo(),
          TextWithUnderline(text: "Benefícios"),
          SizedBox(
            height: 10,
          ),
          BulletItem(text: "Desconto em Academias"),
          SizedBox(
            height: 10,
          ),
          BulletItem(text: "Desconto em Academias"),
          SizedBox(
            height: 10,
          ),
          BulletItem(text: "Desconto em Academias"),
          SizedBox(height: 10),
          BulletItem(text: "Desconto em Academias"),
          SizedBox(height: 60),
          AppText(
              text: "Você tem 155 pontos para usar em:",
              color: AppColors.lightBlue),
          SizedBox(height: 10),
          BulletItem(text: "Desconto na próx. mensalidade"),
          SizedBox(height: 10),
          BulletItem(text: "Terapias"),
          SizedBox(height: 10),
          BulletItem(text: "Próteses"),
          SizedBox(height: 70),
          MeusPontos(resgatar: true)
        ],
      ),
    );
  }
}
