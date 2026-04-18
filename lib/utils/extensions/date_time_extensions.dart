extension DateTimeExtensions on DateTime {
  /// Converts DateTime to local time and returns it as a formatted string
  String toLocalString() {
    final localDateTime = toLocal();
    return localDateTime.toString();
  }

  /// Converts DateTime to local time and returns it as a custom formatted string
  /// Format: yyyy-MM-dd HH:mm:ss
  String toLocalFormattedString() {
    final localDateTime = toLocal();
    return '${localDateTime.year}-${localDateTime.month.toString().padLeft(2, '0')}-${localDateTime.day.toString().padLeft(2, '0')} '
        '${localDateTime.hour.toString().padLeft(2, '0')}:${localDateTime.minute.toString().padLeft(2, '0')}:${localDateTime.second.toString().padLeft(2, '0')}';
  }

  /// Converts DateTime to local time and returns it as a date string
  /// Format: yyyy-MM-dd
  String toLocalDateString() {
    final localDateTime = toLocal();
    return '${localDateTime.year}-${localDateTime.month.toString().padLeft(2, '0')}-${localDateTime.day.toString().padLeft(2, '0')}';
  }

  /// Converts DateTime to local time and returns it as a time string
  /// Format: HH:mm:ss
  String toLocalTimeString() {
    final localDateTime = toLocal();
    return '${localDateTime.hour.toString().padLeft(2, '0')}:${localDateTime.minute.toString().padLeft(2, '0')}:${localDateTime.second.toString().padLeft(2, '0')}';
  }

  /// Converts UTC DateTime to local timezone
  DateTime toLocalTimeZone() {
    return toLocal();
  }

  /// Converts local DateTime to UTC timezone
  DateTime toUtcTimeZone() {
    return toUtc();
  }
}

extension DateTimeStringExtensions on String {
  /// Converts UTC DateTime string to local timezone string in the same format
  /// Input format: yyyy-MM-ddTHH:mm:ss.SSSSSS
  /// Output format: yyyy-MM-ddTHH:mm:ss.SSSSSS

  String utcToLocalTimeZoneString() {
    final utcDateTime = DateTime.parse(this);

    // Get the system's local timezone offset
    final localDateTime = utcDateTime.toLocal();
    final timezoneOffset = localDateTime.timeZoneOffset;

    // Apply timezone offset to convert from UTC
    final convertedDateTime = utcDateTime.add(timezoneOffset);

    final microseconds = convertedDateTime.microsecond.toString().padLeft(
      6,
      '0',
    );

    // Format the datetime with timezone offset
    final offsetHours = timezoneOffset.inHours.abs().toString().padLeft(2, '0');
    final offsetMinutes = (timezoneOffset.inMinutes.abs() % 60)
        .toString()
        .padLeft(2, '0');
    final offsetSign = timezoneOffset.isNegative ? '-' : '+';

    return '${convertedDateTime.year}-${convertedDateTime.month.toString().padLeft(2, '0')}-${convertedDateTime.day.toString().padLeft(2, '0')}T'
        '${convertedDateTime.hour.toString().padLeft(2, '0')}:${convertedDateTime.minute.toString().padLeft(2, '0')}:${convertedDateTime.second.toString().padLeft(2, '0')}.$microseconds$offsetSign$offsetHours:$offsetMinutes';
  }

  /// Parses the string as a DateTime and converts it to local timezone
  DateTime toLocalTimeZone() {
    final dateTime = DateTime.parse(this);
    return dateTime.toLocal();
  }

  /// Parses the string as a DateTime and converts it to UTC timezone
  DateTime toUtcTimeZone() {
    final dateTime = DateTime.parse(this);
    return dateTime.toUtc();
  }
}
