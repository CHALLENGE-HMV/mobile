class UserResponse {
  final String id;
  final String email;
  final String name;
  final String register;
  final DateTime? birthdate;

  const UserResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.register,
    this.birthdate,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      register: json['register'],
      birthdate: DateTime.tryParse(json['register']),
    );
  }
}