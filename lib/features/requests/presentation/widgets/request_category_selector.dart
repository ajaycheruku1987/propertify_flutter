import 'package:propertify/utils/string_extensions.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RequestCategorySelector extends StatelessWidget {
  final String? selectedPropertyType;
  final Function(String) onPropertyTypeChanged;
  final List<Map<String, dynamic>> categories;

  const RequestCategorySelector({
    super.key,
    required this.selectedPropertyType,
    required this.onPropertyTypeChanged,
    required this.categories,
  });



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.category} *',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categories.map((type) {
            final isSelected = selectedPropertyType == type['name'];
            return GestureDetector(
              onTap: () {
                onPropertyTypeChanged(type['name']);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Text(
                  (type['name'] as String).translate(context),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
        if (selectedPropertyType == null || selectedPropertyType!.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              l10n.propertyTypeRequired,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
