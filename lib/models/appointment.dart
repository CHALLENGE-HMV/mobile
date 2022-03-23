import '../helpers/date_helper.dart';

class Appointment {
  final DateTime dateTime;
  final String doctor;
  final String speciality;

  Appointment({
    required this.dateTime,
    required this.doctor,
    required this.speciality,
  });

  static Appointment fromJson(Map json) {
    return Appointment(
      dateTime: DateHelper.parseStringToDateTime(json['data_hora']),
      doctor: json['medico'],
      speciality: json['especialidade'],
    );
  }
}