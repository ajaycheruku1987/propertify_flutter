import 'package:flutter/material.dart';

class AppCategories {
  // Feed / Property Types (Display name, Icon)
  static const List<Map<String, dynamic>> propertyType = [
    {'name': 'Independent House', 'icon': Icons.home_outlined},
    {'name': 'Villa', 'icon': Icons.villa_outlined},
    {'name': 'Apartment Flat', 'icon': Icons.apartment_outlined},
    {'name': 'Open Plot', 'icon': Icons.business_outlined},
    {'name': 'Agriculture Land', 'icon': Icons.landscape_outlined},
    {'name': 'Commercial', 'icon': Icons.storefront_outlined},
    {'name': 'Industrial', 'icon': Icons.factory_outlined},
  ];

  static const List<String> propertyTypeFilterName = [
    'All',
    'Independent House',
    'Villa',
    'Apartment Flat',
    'Open Plot',
    'Agriculture Land',
    'Commercial',
    'Industrial',
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
  static const List<String> lookingForFilter = ['All', 'Sale', 'Rent', 'Lease'];

  // Request categories
  static const List<Map<String, dynamic>> requestCategories = [
    {'name': 'Buy', 'icon': Icons.home_outlined},
    {'name': 'Rent', 'icon': Icons.apartment_outlined},
    {'name': 'Lease', 'icon': Icons.business_outlined},
  ];

  static const List<String> requestCategoriesFilter = ['All', 'Buy', 'Rent', 'Lease'];

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
