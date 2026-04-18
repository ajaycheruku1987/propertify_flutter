  String formatPrice(num? price) {
    if (price == null || price == 0) {
      return '₹0';
    }

    double amount = price.toDouble();

    // Convert to Crores (1 Cr = 10,000,000)
    if (amount >= 10000000) {
      double crores = amount / 10000000;
      return '₹${crores.toStringAsFixed(crores % 1 == 0 ? 0 : 1)}Cr';
    }
    // Convert to Lakhs (1 Lakh = 100,000)
    else if (amount >= 100000) {
      double lakhs = amount / 100000;
      return '₹${lakhs.toStringAsFixed(lakhs % 1 == 0 ? 0 : 1)}L';
    }
    // Convert to Thousands (1K = 1,000)
    else if (amount >= 1000) {
      double thousands = amount / 1000;
      return '₹${thousands.toStringAsFixed(thousands % 1 == 0 ? 0 : 1)}K';
    }
    // Display as is for smaller amounts
    else {
      return '₹${amount.toStringAsFixed(0)}';
    }
  }
