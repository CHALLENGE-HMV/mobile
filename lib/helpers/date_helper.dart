import 'package:intl/intl.dart';

class DateHelper {
  static const _default_pattern_date_time = 'yyyy-MM-ddTHH:mm:ss';
  static const _default_pattern_date = 'yyyy-MM-dd';
  static const _default_pattern_format_date_time = 'dd/MM/yyyy HH:mm:ss';
  static const _default_pattern_format_date = 'dd/MM/yyyy';

  static DateTime parseStringToDateTime(String dateString, [String? pattern]) {
    String? patternToUse = pattern;
    if (patternToUse == null) {
      patternToUse = _default_pattern_date_time;
    }
    DateFormat format = new DateFormat(patternToUse);
    return format.parse(dateString);
  }

  static DateTime parseStringToDate(String dateString, [String? pattern]) {
    String? patternToUse = pattern;
    if (patternToUse == null) {
      patternToUse = _default_pattern_date;
    }
    DateFormat format = new DateFormat(patternToUse);
    return format.parse(dateString);
  }

  static String parseDateTimeToString(DateTime dateTime, [String? pattern]) {
    String? patternToUse = pattern;
    if (patternToUse == null) {
      patternToUse = _default_pattern_format_date_time;
    }
    DateFormat format = new DateFormat(patternToUse);
    return format.format(dateTime);
  }

  static String parseDateToString(DateTime dateTime, [String? pattern]) {
    String? patternToUse = pattern;
    if (patternToUse == null) {
      patternToUse = _default_pattern_format_date;
    }
    DateFormat format = new DateFormat(patternToUse);
    return format.format(dateTime);
  }
}