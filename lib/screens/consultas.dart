import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';
import 'package:minha_saude/models/appointment.dart';
import 'package:minha_saude/repositories/appointment_repository.dart';
import 'package:minha_saude/services/appointment_service.dart';
import 'package:minha_saude/widgets/app_header.dart';
import 'package:minha_saude/widgets/app_text.dart';
import 'package:minha_saude/widgets/bullet_item.dart';
import 'package:minha_saude/widgets/leading_logo.dart';
import 'package:minha_saude/widgets/meus_pontos.dart';
import 'package:minha_saude/widgets/text_with_under_line.dart';

import '../helpers/date_helper.dart';

class ConsultasPage extends StatefulWidget {
  @override
  _ConsultasPageState createState() => _ConsultasPageState();
}

class _ConsultasPageState extends State<ConsultasPage> {
  int selectedValueAgendada = DateTime.now().year;
  int selectedValueRealizada = DateTime.now().year;
  late Future<List<Appointment>> _appointmentAgendadaList;
  late Future<List<Appointment>> _appointmentRealizadaList;

  AppointmentRepository _appointmentRepository =
      ApiAppointmentRepository(ApiAppointmentService());

  @override
  Widget build(BuildContext context) {
    _appointmentAgendadaList = _appointmentRepository
        .fetchAppointmentsScheduledOfYear(selectedValueAgendada);
    _appointmentRealizadaList = _appointmentRepository
        .fetchAppointmentsDoneOfYear(selectedValueRealizada);

    List<int> years = [];
    int currentYear = DateTime.now().year;
    for (int i = currentYear - 5; i <= currentYear + 1; i++) {
      years.add(i);
    }

    return AppHeader(
      child: Stack(
        children: [
          Column(
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
                    FutureBuilder<List<Appointment>>(
                      future: _appointmentAgendadaList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Appointment appointment = snapshot.data![index];
                                return _ItemConsulta(appointment: appointment);
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
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
                    FutureBuilder<List<Appointment>>(
                      future: _appointmentRealizadaList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Appointment appointment = snapshot.data![index];
                                return _ItemConsulta(appointment: appointment);
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
          MeusPontos()
        ],
      ),
    );
  }
}

class _ItemConsulta extends StatelessWidget {
  final Appointment appointment;

  const _ItemConsulta({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        BulletItem(
            text:
                '${DateHelper.parseDateTimeToString(appointment.dateTime)} - ${appointment.speciality} - ${appointment.doctor}')
      ],
    );
  }
}
