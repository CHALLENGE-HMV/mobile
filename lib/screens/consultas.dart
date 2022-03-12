import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';
import 'package:minha_saude/widgets/year_picker.dart';

class ConsultasPage extends StatefulWidget {
  @override
  _ConsultasPageState createState() => _ConsultasPageState();
}

class _ConsultasPageState extends State<ConsultasPage> {
  int? selectedValueAgendada;
  int? selectedValueRealizada;

  @override
  Widget build(BuildContext context) {
    List<int> years = [];
    int currentYear = DateTime.now().year;
    for (int i = currentYear - 5; i <= currentYear + 1; i++) {
      years.add(i);
    }

    return AppHeader(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadingLogo(),
          TextWithUnderline(text: "Consultas"),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 170,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      AppText(text: "Agendadas"),
                      SizedBox(width: 15),
                      DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          child: DropdownButton<int>(
                            items: years.map((int year) {
                              return DropdownMenuItem(
                                child: Text(year.toString()),
                                value: year,
                              );
                            }).toList(),
                            value: selectedValueAgendada,
                            hint: Text(currentYear.toString()),
                            style: TextStyle(color: Colors.black),
                            onChanged: (newVal) {
                              setState(() {
                                selectedValueAgendada = newVal!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "25/03/2022 15:20 - Cl. Geral - Dr. Renato Fi"),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "25/06/2022 15:20 - Oftalmologista - Dra. Cr"),
                SizedBox(height: 10),
                BulletItem(text: "25/08/2022 15:20 - Otorrino - Dr. Cesar Rib"),
                SizedBox(height: 60),
                Container(
                  width: 170,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      AppText(text: "Realizadas"),
                      SizedBox(width: 15),
                      DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          child: DropdownButton<int>(
                            items: years.map((int year) {
                              return DropdownMenuItem(
                                child: Text(year.toString()),
                                value: year,
                              );
                            }).toList(),
                            value: selectedValueRealizada,
                            hint: Text(currentYear.toString()),
                            style: TextStyle(color: Colors.black),
                            onChanged: (newVal) {
                              setState(() {
                                selectedValueRealizada = newVal!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "25/03/2022 15:20 - Cl. Geral - Dr. Renato Fi"),
                SizedBox(
                  height: 10,
                ),
                BulletItem(text: "25/06/2022 15:20 - Oftalmologista - Dra. Cr"),
                SizedBox(height: 10),
                BulletItem(text: "25/08/2022 15:20 - Otorrino - Dr. Cesar Rib"),
              ],
            ),
          ),
          SizedBox(height: 50),
          MeusPontos()
        ],
      ),
    );
  }
}
