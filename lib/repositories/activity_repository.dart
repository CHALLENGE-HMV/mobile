import 'dart:convert';

import 'package:minha_saude/models/activity.dart';
import 'package:minha_saude/services/activity_service.dart';

abstract class ActivityRepository {
  Future<List<Activity>> fetchActivities();
}

class ApiActivityRepository extends ActivityRepository {
  final ActivityService _activityService;

  ApiActivityRepository(this._activityService);

  @override
  Future<List<Activity>> fetchActivities() async {
    final response = await _activityService.getActivities();
    var json = jsonDecode(response.body);
    return json.map<Activity>((data) => Activity.fromJson(data)).toList();
  }
}