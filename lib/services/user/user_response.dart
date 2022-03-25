import '../../helpers/date_helper.dart';

class UserResponse {
  final int id;
  final String email;
  final String name;
  final String register;
  final int points;
  final DateTime birthdate;
  final DateTime lastAppointment;
  final DateTime nextAppointment;

  const UserResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.register,
    required this.points,
    required this.birthdate,
    required this.lastAppointment,
    required this.nextAppointment
  });

  factory UserResponse.fromApiJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json['id'],
        email: json['email'],
        name: json['nome'],
        register: json['registro'],
        points: json['pontos'],
        birthdate: DateHelper.parseStringToDate(json['dataNascimento']),
        lastAppointment: DateHelper.parseStringToDate(json['dataUltimaConsulta']),
        nextAppointment: DateHelper.parseStringToDate(json['dataProximaConsulta']));
  }

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        register: json['register'],
        points: json['points'],
        birthdate: DateHelper.parseStringToDateTime(json['birthdate'], 'dd/MM/yyyy HH:mm:ss'),
        lastAppointment: DateHelper.parseStringToDate(json['last_appointment'], 'dd/MM/yyyy'),
        nextAppointment: DateHelper.parseStringToDate(json['next_appointment'], 'dd/MM/yyyy'));
  }
}
