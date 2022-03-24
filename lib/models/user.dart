import 'package:minha_saude/services/user/user_response.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String register;
  final DateTime? birthdate;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.register,
    this.birthdate,
  });

  factory User.fromResponse(UserResponse resp) {
    return User(
      id: resp.id,
      email: resp.email,
      name: resp.name,
      register: resp.register,
      birthdate: resp.birthdate,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'register': register,
        'birthdate': birthdate.toString(),
      };

  @override
  String toString() {
    return '{id: $id, name: $name, email: $email, register: $register, birthdate: $birthdate }';
  }
}
