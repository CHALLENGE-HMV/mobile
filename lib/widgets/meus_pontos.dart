import 'package:flutter/material.dart';
import 'package:minha_saude/config/routes/routes.dart';
import 'package:minha_saude/constants/app_constants.dart';

import 'app_text.dart';

class MeusPontos extends StatelessWidget {
  final bool resgatar;

  MeusPontos({Key? key, this.resgatar=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            if (!resgatar) {
              Navigator.of(context).pushNamed(Routes.beneficios);
            }
          },
          child: AppText(
            text: resgatar ? "Resgatar pontos >>" : "Meus pontos >>",
            color: AppColors.orange,
          ),
        )
      ],
    );
  }
}
