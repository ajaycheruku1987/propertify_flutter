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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Request Category *',
          style: TextStyle(
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
                  type['name'],
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
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Property type is required',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
