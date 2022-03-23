import 'dart:convert';

import 'package:minha_saude/services/appointment_service.dart';

import '../models/appointment.dart';
import '../models/medicine.dart';
import '../services/medicine_service.dart';

abstract class AppointmentRepository {
  Future<List<Appointment>> fetchAppointmentsDoneOfYear(int year);
  Future<List<Appointment>> fetchAppointmentsScheduledOfYear(int year);
}

class ApiAppointmentRepository extends AppointmentRepository {
  final AppointmentService _appointmentService;

  ApiAppointmentRepository(this._appointmentService);

  @override
  Future<List<Appointment>> fetchAppointmentsDoneOfYear(int year) async {
    final response = await _appointmentService.getAppointmentsDoneOfYear(year);
    var json = jsonDecode(response.body);
    return json.map<Appointment>((data) => Appointment.fromJson(data)).toList();
  }

  @override
  Future<List<Appointment>> fetchAppointmentsScheduledOfYear(int year) async {
    final response = await _appointmentService.getAppointmentsScheduledOfYear(year);
    var json = jsonDecode(response.body);
    return json.map<Appointment>((data) => Appointment.fromJson(data)).toList();
  }
}