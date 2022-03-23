class Activity {
  final String description;

  Activity({required this.description});

  static Activity fromJson(Map json) {
    return Activity(description: json['descricao']);
  }
}
