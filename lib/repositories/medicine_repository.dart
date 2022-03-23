import 'dart:convert';

import '../models/medicine.dart';
import '../services/medicine_service.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> fetchMedicines();
}

class ApiMedicineRepository extends MedicineRepository {
  final MedicineService _medicineService;

  ApiMedicineRepository(this._medicineService);

  @override
  Future<List<Medicine>> fetchMedicines() async {
    final response = await _medicineService.getMedicines();
    var json = jsonDecode(response.body);
    return json.map<Medicine>((data) => Medicine.fromJson(data)).toList();
  }
}