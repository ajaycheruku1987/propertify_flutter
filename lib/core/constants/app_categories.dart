import 'package:flutter/material.dart';

class AppCategories {
  // Feed / Property Types (Display name, Icon)
  static const List<Map<String, dynamic>> propertyTypes = [
    {'name': 'Independent House', 'icon': Icons.home_outlined},
    {'name': 'Villas', 'icon': Icons.villa_outlined},
    {'name': 'Apartments', 'icon': Icons.apartment_outlined},
    {'name': 'Open Plot', 'icon': Icons.business_outlined},
    {'name': 'Agriculture Land', 'icon': Icons.landscape_outlined},
    {'name': 'Commercial', 'icon': Icons.storefront_outlined},
    {'name': 'Industrial', 'icon': Icons.factory_outlined},
  ];

  static const List<String> propertyTypeFilterNames = [
    'All',
    'Independent House',
    'Villas',
    'Apartments',
    'Open Plot',
    'Agriculture Land',
    'Commercial',
    'Industrial',
  ];

  // Feed / Looking For options
  static const List<String> lookingFor = ['Sell', 'Rent', 'Lease'];
  static const List<String> lookingForFilter = ['All', 'Sales', 'Rent', 'Lease'];

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
    'Villas',
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
