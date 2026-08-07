import 'package:flutter/widgets.dart';
import 'package:propertify/l10n/app_localizations.dart';

extension StringCapitalization on String {
  /// Translates category names and other dynamic strings if a key exists in AppLocalizations
  String translate(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return this;

    final key = toLowerCase().trim().replaceAll(' ', '');
    
    // Manual mapping for common dynamic strings
    switch (key) {
      case 'independenthouse': return l10n.independentHouse;
      case 'villa': return l10n.villa;
      case 'villas': return l10n.villas;
      case 'apartment': return l10n.apartment;
      case 'apartments': return l10n.apartments;
      case 'flats': return l10n.flats;
      case 'apartmentflat': return l10n.apartmentFlat;
      case 'openplot': return l10n.openPlot;
      case 'openplots': return l10n.openPlots;
      case 'agricultureland': return l10n.agricultureLand;
      case 'commercial': return l10n.commercial;
      case 'industrial': return l10n.industrial;
      case 'all': return l10n.all;
      case 'sell': return l10n.sell;
      case 'rent': return l10n.rent;
      case 'lease': return l10n.lease;
      case 'sale': return l10n.sale;
      case 'sales': return l10n.sales;
      case 'buy': return l10n.buy;
      case 'loan': return l10n.loan;
      case 'interiordesign': return l10n.interiorDesign;
      case 'realestate': return l10n.realEstate;
      case 'plots': return l10n.plots;
      case 'sand': return l10n.sand;
      case 'rocks': return l10n.rocks;
      case 'steel': return l10n.steel;
      case 'cement': return l10n.cement;
      case 'buildingmaterialsupply': return l10n.buildingMaterialSupply;
      case 'legal': return l10n.legal;
      case 'documentverification': return l10n.documentVerification;
      case 'advocate': return l10n.advocate;
      case 'constructioncontractor': return l10n.constructionContractor;
      case 'propertyvaluation': return l10n.propertyValuation;
      case 'leasing': return l10n.leasing;
      case 'house': return l10n.house;
      case 'land': return l10n.land;
      case 'construction': return l10n.construction;
      default: return this;
    }
  }

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
