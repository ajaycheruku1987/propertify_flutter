extension StringCapitalization on String {
  /// Capitalizes the first letter of the string
  /// Example: "hello world" -> "Hello world"
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalizes the first letter of each word (Title Case)
  /// Example: "hello world" -> "Hello World"
  String toTitleCase() {
    if (isEmpty) return this;
    return split(
      ' ',
    ).map((word) => word.isEmpty ? word : word.capitalize()).join(' ');
  }

  /// Capitalizes first letter and converts rest to lowercase
  /// Example: "HELLO WORLD" -> "Hello world"
  String toSentenceCase() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalizes nullable strings, returns empty string if null
  static String capitalizeNullable(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.capitalize();
  }

  /// Title case for nullable strings, returns empty string if null
  static String toTitleCaseNullable(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.toTitleCase();
  }
}
