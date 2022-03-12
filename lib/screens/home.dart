import 'package:flutter/material.dart';
import 'package:minha_saude/widgets/app_footer.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingLogo(),
          SizedBox(
            height: 260,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWithUnderline(
                  text: "Olá, Fernando",
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(text: "Registro Nº: 5688-NS"),
                SizedBox(
                  height: 5,
                ),
                AppText(text: "Última consulta em: 15/09/2021"),
                SizedBox(
                  height: 5,
                ),
                AppText(text: "Próxima consulta em: 25/03/2022"),
                SizedBox(
                  height: 5,
                ),
                AppText(text: "Pontos: 155"),
              ],
            ),
          ),
          MeusPontos(),
        ],
      ),
    );
  }
}
