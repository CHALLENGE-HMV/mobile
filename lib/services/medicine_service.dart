import 'package:http/http.dart' as http;
import 'package:minha_saude/constants/api_path.dart';
import 'package:minha_saude/services/user/user_service.dart';

abstract class MedicineService {
  Future<http.Response> getMedicines();
}

class ApiMedicineService extends MedicineService {
  UserService _userService = UserService();
  @override
  Future<http.Response> getMedicines() async {
    int? userId = 0;
    await _userService.getUserSession().then((user) => {
      if (user != null) {
        userId = user.id
      }
    });
    var url = Uri.parse('${Api.url_medicines}?userId=$userId');
    final response = await http.get(url).timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception('Failed to load medicines');
  }
}