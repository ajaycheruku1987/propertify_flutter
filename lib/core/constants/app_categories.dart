import 'package:flutter/material.dart';

class AppCategories {
  // Feed / Property Types (Display name, Icon)
  static const List<Map<String, dynamic>> propertyTypes = [
    {'name': 'Villas', 'icon': Icons.villa_outlined},
    {'name': 'Apartments', 'icon': Icons.apartment_outlined},
    {'name': 'Open Plot', 'icon': Icons.business_outlined},
  ];

  static const List<String> propertyTypeFilterNames = [
    'All',
    'Villas',
    'Apartments',
    'Open Plot',
  ];

  // Feed / Looking For options
  static const List<String> lookingFor = ['Sell', 'Rent'];
  static const List<String> lookingForFilter = ['All', 'Sales', 'Rent'];

  // Request categories
  static const List<Map<String, dynamic>> requestCategories = [
    {'name': 'Buy', 'icon': Icons.home_outlined},
    {'name': 'Rent', 'icon': Icons.apartment_outlined},
  ];

  static const List<String> requestCategoriesFilter = ['All', 'Buy', 'Rent'];

  static const List<Map<String, dynamic>> loanAndInteriorCategories = [
    {'name': 'Loan', 'icon': Icons.home_outlined},
    {'name': 'Interior Design', 'icon': Icons.apartment_outlined},
  ];

  // Service categories
  static const List<String> serviceCategories = [
    'Real estate',
    'Plots',
    'Building Material Supply',
    'Advocate',
    'Construction Contractor',
    'Property valuation',
    'Leasing',
    'Villas',
  ];

  static const List<String> serviceCategoriesFilter = [
    'All',
    'Real estate',
    'Plots',
    'Building Material Supply',
    'Advocate',
    'Construction Contractor',
    'Property valuation',
    'Leasing',
    'Villas',
  ];

  // Company categories
  static const List<String> companyCategories = [
    'Apartment',
    'Villas',
    'House',
    'Commercial',
    'Land',
    'Industrial',
  ];
}
