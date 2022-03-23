import 'package:minha_saude/helpers/date_helper.dart';
import 'package:minha_saude/services/user/user_response.dart';

class User {
  final int id;
  final String email;
  final String name;
  final String register;
  final int points;
  final DateTime birthdate;
  final DateTime lastAppointment;
  final DateTime nextAppointment;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.register,
    required this.points,
    required this.birthdate,
    required this.lastAppointment,
    required this.nextAppointment
  });

  factory User.fromResponse(UserResponse resp) {
    return User(
      id: resp.id,
      email: resp.email,
      name: resp.name,
      register: resp.register,
      points: resp.points,
      birthdate: resp.birthdate,
      lastAppointment: resp.lastAppointment,
      nextAppointment: resp.nextAppointment
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'register': register,
        'points': points,
        'birthdate': DateHelper.parseDateTimeToString(birthdate),
        'last_appointment': DateHelper.parseDateToString(lastAppointment),
        'next_appointment': DateHelper.parseDateToString(nextAppointment),
      };

  @override
  String toString() {
    return '{id: $id, name: $name, email: $email, register: $register, points: $points, birthdate: $birthdate, last_appointment: $lastAppointment, next_appointment: $nextAppointment }';
  }
}
