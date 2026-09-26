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

extension PromotionDateHelper on String? {
  /// Parses an expiry or promotion date string (e.g. `expiresAt` / `promotedUntil`)
  /// and adjusts date-only or midnight timestamps to the end of that day (`23:59:59.999`).
  DateTime? parsePromotionExpiryDate() {
    if (this == null || this!.trim().isEmpty) return null;
    final cleanStr = this!.trim();

    DateTime? parsed;
    try {
      parsed = DateTime.tryParse(cleanStr);
      if (parsed == null) {
        parsed = DateTime.tryParse(cleanStr.replaceAll(' ', 'T'));
      }
    } catch (_) {}

    if (parsed == null) return null;

    // If no explicit non-zero time was provided (e.g., "2026-09-27" or "2026-09-27T00:00:00.000Z"),
    // extend expiry to the end of the day (23:59:59.999) in local time.
    if (parsed.hour == 0 && parsed.minute == 0 && parsed.second == 0) {
      final local = parsed.toLocal();
      return DateTime(
        local.year,
        local.month,
        local.day,
        23,
        59,
        59,
        999,
      );
    }
    return parsed.toLocal();
  }

  /// Checks if the promotion date is expired compared to [now].
  bool isPromotionExpired([DateTime? now]) {
    final expiry = parsePromotionExpiryDate();
    if (expiry == null) return false;
    final currentTime = now ?? DateTime.now();
    return currentTime.isAfter(expiry);
  }

  /// Calculates the number of days remaining until promotion expiry.
  /// Returns 0 if expired, or at least 1 day if not yet expired.
  int promotionDaysRemaining([DateTime? now]) {
    final expiry = parsePromotionExpiryDate();
    if (expiry == null) return 0;
    final currentTime = now ?? DateTime.now();
    if (currentTime.isAfter(expiry)) return 0;

    final nowDateOnly =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final expiryDateOnly = DateTime(expiry.year, expiry.month, expiry.day);
    final calendarDays = expiryDateOnly.difference(nowDateOnly).inDays;

    return calendarDays <= 0 ? 1 : calendarDays;
  }
}
