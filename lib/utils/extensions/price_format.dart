String formatIndianCurrency(dynamic price) {
  if (price == null) return '0';
  final String numStr = price.toString().replaceAll(RegExp(r'[^0-9.]'), '');
  if (numStr.isEmpty) return price.toString();

  final List<String> parts = numStr.split('.');
  final String intPart = parts[0];

  final int? val = int.tryParse(intPart);
  if (val == null) return price.toString();

  final String str = val.toString();
  if (str.length <= 3) {
    return parts.length > 1 ? '$str.${parts[1]}' : str;
  }

  final String lastThree = str.substring(str.length - 3);
  String otherDigits = str.substring(0, str.length - 3);

  otherDigits = otherDigits.replaceAllMapped(
    RegExp(r'\B(?=(\d{2})+(?!\d))'),
    (match) => ',',
  );

  String formatted = '$otherDigits,$lastThree';
  if (parts.length > 1 && parts[1].isNotEmpty) {
    formatted += '.${parts[1]}';
  }
  return formatted;
}

String formatPrice(num? price) {
  if (price == null || price == 0) {
    return '₹0';
  }

  final double amount = price.toDouble();

  // Convert to Crores (1 Cr = 10,000,000)
  if (amount >= 10000000) {
    final double crores = amount / 10000000;
    return '₹${crores.toStringAsFixed(crores % 1 == 0 ? 0 : 1)}Cr';
  }
  // Convert to Lakhs (1 Lakh = 100,000)
  else if (amount >= 100000) {
    final double lakhs = amount / 100000;
    return '₹${lakhs.toStringAsFixed(lakhs % 1 == 0 ? 0 : 1)}L';
  }
  // Convert to Thousands (1K = 1,000)
  else if (amount >= 1000) {
    final double thousands = amount / 1000;
    return '₹${thousands.toStringAsFixed(thousands % 1 == 0 ? 0 : 1)}K';
  }
  // Display as is for smaller amounts
  else {
    return '₹${amount.toStringAsFixed(0)}';
  }
}
