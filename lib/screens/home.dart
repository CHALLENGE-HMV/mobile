import 'package:flutter/material.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

import '../helpers/date_helper.dart';
import '../services/user/user_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Stack(
        children: [
          Column(
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
                      text: 'Olá, ${UserService.user!.name}',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Registro Nº: ${UserService.user!.register}'),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Última consulta em: ${DateHelper.parseDateToString(UserService.user!.lastAppointment)}'),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Próxima consulta em: ${DateHelper.parseDateToString(UserService.user!.nextAppointment)}'),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Pontos: ${UserService.user!.points.toString()}'),
                  ],
                ),
              ),
            ],
          ),
          MeusPontos(),
        ],
      ),
    );
  }
}
