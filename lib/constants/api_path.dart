class Api {
  static const _host = 'http://10.0.2.2:8080';
  static const _path_medicines = '/api/medicines';
  static const _path_appointments = '/api/appointments';
  static const _path_appointments_done = '$_path_appointments/done';
  static const _path_appointments_scheduled = '$_path_appointments/scheduled';
  static const _path_activities = '/api/activities';
  static const _path_users = '/api/users';
  static const url_medicines = '$_host$_path_medicines/active';
  static const url_appointments_done = '$_host$_path_appointments_done';
  static const url_appointments_scheduled = '$_host$_path_appointments_scheduled';
  static const url_activities = '$_host$_path_activities';
  static const url_login = '$_host$_path_users/login';
  static const url_register = '$_host$_path_users/register';
}