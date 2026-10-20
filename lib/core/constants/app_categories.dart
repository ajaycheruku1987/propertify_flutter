import 'package:flutter/material.dart';

class AppCategories {
  // Structured Property Categories & Subcategories Hierarchy
  static const Map<String, List<String>> propertyCategoryHierarchy = {
    'Residential': [
      'Apartment / Flat',
      'Independent House',
      'Villa',
      'Duplex',
      'Farmhouse',
      'Builder Floor',
    ],
    'Land & Plots': [
      'Residential Plot',
      'Commercial Plot',
      'Gated Community Plot',
      'Agricultural Land',
      'Farm Land',
    ],
    'Commercial': [
      'Shop',
      'Office',
      'Showroom',
      'Warehouse',
      'Commercial Building',
    ],
    'Industrial': [
      'Industrial Plot',
      'Factory',
      'Industrial Shed',
      'Warehouse',
    ],
  };

  /// Flat unique subcategory list (matches create-post `property_type` values).
  static List<String> get allPropertySubCategories {
    final seen = <String>{};
    final result = <String>[];
    for (final subs in propertyCategoryHierarchy.values) {
      for (final sub in subs) {
        if (seen.add(sub)) result.add(sub);
      }
    }
    return result;
  }

  static List<String> get propertyTypeFilterName => [
        'All',
        ...allPropertySubCategories,
      ];

  static IconData iconForMainCategory(String main) {
    switch (main) {
      case 'Residential':
        return Icons.home_outlined;
      case 'Land & Plots':
        return Icons.landscape_outlined;
      case 'Commercial':
        return Icons.storefront_outlined;
      case 'Industrial':
        return Icons.factory_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  static IconData iconForSubCategory(String name) {
    for (final entry in propertyCategoryHierarchy.entries) {
      if (entry.value.contains(name)) {
        return iconForMainCategory(entry.key);
      }
    }
    return Icons.category_outlined;
  }

  /// Main categories for home horizontal chips.
  static List<Map<String, dynamic>> get mainPropertyCategories => [
        for (final main in propertyCategoryHierarchy.keys)
          {'name': main, 'icon': iconForMainCategory(main)},
      ];

  /// Subcategory chips (used by edit screens / legacy callers).
  static List<Map<String, dynamic>> get propertyType => [
        for (final name in allPropertySubCategories)
          {'name': name, 'icon': iconForSubCategory(name)},
      ];

  /// Maps filter "Looking for" UI value → API `listing_type`.
  static String? mapLookingForToListingType(String? lookingFor) {
    if (lookingFor == null || lookingFor.isEmpty || lookingFor == 'All') {
      return null;
    }
    if (lookingFor == 'Sale' || lookingFor == 'Sales') return 'Sell';
    return lookingFor;
  }

  /// True when [value] is a main category from the hierarchy.
  static bool isMainCategory(String? value) {
    if (value == null || value.isEmpty || value == 'All') return false;
    return propertyCategoryHierarchy.containsKey(value);
  }

  /// Resolves filter selection into API params.
  /// Main category → `mainCategory`; subcategory → `propertyType`.
  static ({String? propertyType, String? mainCategory}) resolvePropertyFilter(
    List<dynamic>? propertyTypes,
  ) {
    if (propertyTypes == null ||
        propertyTypes.isEmpty ||
        propertyTypes.contains('All')) {
      return (propertyType: null, mainCategory: null);
    }

    final selected = propertyTypes.first.toString();
    if (isMainCategory(selected)) {
      return (propertyType: null, mainCategory: selected);
    }
    return (propertyType: selected, mainCategory: null);
  }

  // Property Construction/Listing Statuses (For non-plot properties)
  static const List<String> propertyStatuses = [
    'Ready to Move',
    'Under Construction',
    'New',
    'Resale',
    'Pre-launch',
  ];

  static const List<Map<String, dynamic>> propertyTypeForProject = [
    {'name': 'Villas', 'icon': Icons.villa_outlined},
    {'name': 'Flats', 'icon': Icons.apartment_outlined},
    {'name': 'Open Plots', 'icon': Icons.business_outlined},
    {'name': 'Commercial', 'icon': Icons.storefront_outlined},
  ];

  static const List<String> propertyTypeFilterNameForProject = [
    'All',
    'Villas',
    'Flats',
    'Open Plots',
    'Commercial',
  ];

  // Feed / Looking For options
  static const List<String> lookingFor = ['Sell', 'Rent', 'Lease'];
  static const List<String> lookingForFilter = ['All', 'Sell', 'Rent', 'Lease'];

  // Request categories
  static const List<Map<String, dynamic>> requestCategories = [
    {'name': 'Buy', 'icon': Icons.home_outlined},
    {'name': 'Rent', 'icon': Icons.apartment_outlined},
    {'name': 'Lease', 'icon': Icons.business_outlined},
  ];

  static const List<String> requestCategoriesFilter = [
    'All',
    'Buy',
    'Rent',
    'Lease',
  ];

  static const List<Map<String, dynamic>> loanAndInteriorCategories = [
    {'name': 'Loan', 'icon': Icons.home_outlined},
    {'name': 'Interior Design', 'icon': Icons.apartment_outlined},
  ];

  // Service categories
  static const List<String> serviceCategories = [
    'Real estate',
    'Plots',
    'Sand',
    'Rocks',
    'Steel',
    'Cement',
    'Building Material Supply',
    'Legal',
    'Document Verification',
    'Advocate',
    'Construction Contractor',
    'Property valuation',
    'Leasing',
    'Villa',
  ];

  static const List<String> serviceCategoriesFilter = [
    'All',
    'Real estate',
    'Plots',
    'Sand',
    'Rocks',
    'Steel',
    'Cement',
    'Building Material Supply',
    'Legal',
    'Document Verification',
    'Advocate',
    'Construction Contractor',
    'Property valuation',
    'Leasing',
    'Villa',
  ];

  // Company categories
  static const List<String> companyCategories = [
    'Construction',
    'Open Plots',
    'Commercial',
  ];
}
