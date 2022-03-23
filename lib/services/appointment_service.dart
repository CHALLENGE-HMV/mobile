import 'package:http/http.dart' as http;
import 'package:minha_saude/constants/api_path.dart';
import 'package:minha_saude/services/user/user_service.dart';

abstract class AppointmentService {
  Future<http.Response> getAppointmentsDoneOfYear(int year);
  Future<http.Response> getAppointmentsScheduledOfYear(int year);
}

class ApiAppointmentService extends AppointmentService {
  UserService _userService = UserService();

  @override
  Future<http.Response> getAppointmentsDoneOfYear(int year) async {
    return _getAppointmentsOfYear(year, '${Api.url_appointments_done}');
  }

  @override
  Future<http.Response> getAppointmentsScheduledOfYear(int year) async {
    return _getAppointmentsOfYear(year, '${Api.url_appointments_scheduled}');
  }

  Future<http.Response> _getAppointmentsOfYear(int year, String urlBase) async {
    int userId = 0;
    await _userService.getUserSession().then((user) => {
      if (user != null) {
        userId = user.id
      }
    });
    String urlWithParams = '$urlBase?year=$year&userId=$userId';
    var url = Uri.parse(urlWithParams);
    final response = await http.get(url).timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Failed to load appointments');
  }
}

