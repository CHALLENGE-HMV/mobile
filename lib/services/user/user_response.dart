import '../../helpers/date_helper.dart';

class UserResponse {
  final int id;
  final String email;
  final String? name;
  final String? register;
  final int? points;
  final DateTime? birthdate;
  final DateTime? lastAppointment;
  final DateTime? nextAppointment;

  const UserResponse({
    required this.id,
    required this.email,
    this.name,
    this.register,
    this.points,
    this.birthdate,
    this.lastAppointment,
    this.nextAppointment
  });

  factory UserResponse.fromApiJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json['id'],
        email: json['email'],
        name: json['nome'] != null ? json['nome'] : '',
        register: json['registro'] != null ? json['registro'] : 'NS-55389',
        points:  json['pontos'] !=  null ? json['pontos'] : 250,
        birthdate: DateTime.parse("1975-02-27 13:00:00"),
        lastAppointment: DateTime.parse("2021-10-29 13:27:00"),
        nextAppointment: DateTime.parse("2022-06-27 14:00:00")
    );
  }

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json['id'],
        email: json['email'],
        name: json['name'] !=  null ? json['name'] : '',
        register: json['register'] != null ? json['register'] : '',
        points: json['points'] != null ? json['points'] : '',
        birthdate: json['birthdate'] != null ? DateHelper.parseStringToDateTime(json['birthdate'], 'dd/MM/yyyy HH:mm:ss') : null,
        lastAppointment: json['last_appointment'] != null ? DateHelper.parseStringToDate(json['last_appointment'], 'dd/MM/yyyy') : null,
        nextAppointment: json['next_appointment'] != null ? DateHelper.parseStringToDate(json['next_appointment'], 'dd/MM/yyyy') : null);
  }
}
