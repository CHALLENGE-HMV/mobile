import 'package:flutter/material.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

import '../helpers/date_helper.dart';
import '../models/user.dart';
import '../services/user/user_service.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  User? _user;
  UserService _userService = UserService();
  String _lastAppointment = '';
  String _nextAppointment = '';

  _HomePageState(){
    _userService.getUserSession().then((user) => setState(() {
      _user = user;
      if(user != null) {
        _lastAppointment = DateHelper.parseDateToString(user.lastAppointment);
        _nextAppointment = DateHelper.parseDateToString(user.nextAppointment);
      }
    }));
  }

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
                      text: 'Olá, ${_user?.name}',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Registro Nº: ${_user?.register}'),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Última consulta em: $_lastAppointment'),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Próxima consulta em: $_nextAppointment'),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: 'Pontos: ${_user?.points}'),
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

