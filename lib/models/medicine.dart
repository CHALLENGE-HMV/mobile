import 'package:minha_saude/helpers/date_helper.dart';

class Medicine {
  final DateTime dateTimeStart;
  final int interval;
  final String name;
  final int qtdDose;

  Medicine({
    required this.dateTimeStart,
    required this.interval,
    required this.name,
    required this.qtdDose,
  });

  static Medicine fromJson(Map json) {
    return Medicine(
      name: json['nome'],
      dateTimeStart: DateHelper.parseStringToDateTime(json['data_hora_inicio']),
      interval: json['intervalo'],
      qtdDose: json['qtd_dose'],
    );
  }

  DateTime getNextDose() {
    DateTime now = DateTime.now();
    DateTime nextDose = this.dateTimeStart;
    while(now.isBefore(nextDose)) {
      nextDose = nextDose.add(Duration(hours: this.interval));
    }
    return nextDose;
  }
}