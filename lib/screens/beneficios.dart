import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/services/user/user_service.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

import '../models/user.dart';

class BeneficiosPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _BeneficiosPageState();
  }
}

class _BeneficiosPageState extends State<BeneficiosPage>{
  User? _user;
  UserService _userService = UserService();

  _BeneficiosPageState(){
    _userService.getUserSession().then((user) => setState(() {
      _user = user;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      child: Stack(
        children: [
          Column(
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
                  text: 'Você tem ${_user?.points} pontos para usar em:',
                  color: AppColors.lightBlue),
              SizedBox(height: 10),
              BulletItem(text: "Desconto na próx. mensalidade"),
              SizedBox(height: 10),
              BulletItem(text: "Terapias"),
              SizedBox(height: 10),
              BulletItem(text: "Próteses"),
              SizedBox(height: 70),
            ],
          ),
          MeusPontos(resgatar: true)
        ],
      ),
    );
  }
}
