import 'package:flutter/material.dart';
import 'package:propertify/core/constants/app_categories.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';

class CategoryOptionsBottomSheet extends StatefulWidget {
  final String mainCategory;
  final Map<String, dynamic>? activeFilter;
  final Function(Map<String, dynamic>) onApply;

  const CategoryOptionsBottomSheet({
    super.key,
    required this.mainCategory,
    this.activeFilter,
    required this.onApply,
  });

  static void show(
    BuildContext context, {
    required String mainCategory,
    Map<String, dynamic>? activeFilter,
    required Function(Map<String, dynamic>) onApply,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CategoryOptionsBottomSheet(
        mainCategory: mainCategory,
        activeFilter: activeFilter,
        onApply: onApply,
      ),
    );
  }

  @override
  State<CategoryOptionsBottomSheet> createState() =>
      _CategoryOptionsBottomSheetState();
}

class _CategoryOptionsBottomSheetState
    extends State<CategoryOptionsBottomSheet> {
  String? _selectedLookingFor;
  String? _selectedSubCategory;

  @override
  void initState() {
    super.initState();
    if (widget.activeFilter != null) {
      _selectedLookingFor = widget.activeFilter!['lookingFor'];
      final propertyTypes = widget.activeFilter!['propertyTypes'] as List?;
      if (propertyTypes != null && propertyTypes.isNotEmpty) {
        _selectedSubCategory = propertyTypes.first as String;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final subcategories =
        AppCategories.propertyCategoryHierarchy[widget.mainCategory] ?? [];
    final lookingForOptions = ['Sell', 'Rent', 'Lease'];
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${widget.mainCategory.translate(context)} Options',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Looking For section (Sale, Rent, Lease)
            Text(
              l10n.lookingFor,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: lookingForOptions.map((option) {
                final isSelected = _selectedLookingFor == option;
                final displayLabel = option == 'Sell' ? 'Sale' : option;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedLookingFor = isSelected ? null : option;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? theme.primaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected
                                ? theme.primaryColor
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            displayLabel.translate(context),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Subcategories section
            Text(
              l10n.propertyType,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: subcategories.map((sub) {
                final isSelected = _selectedSubCategory == sub;
                return ChoiceChip(
                  label: Text(sub.translate(context)),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedSubCategory = selected ? sub : null;
                    });
                  },
                  selectedColor: theme.primaryColor,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 13,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // Action Buttons (Reset & Apply)
            Row(
              children: [
                Expanded(
                  child: CommonCustomButton(
                    onTap: () {
                      widget.onApply({});
                      Navigator.pop(context);
                    },
                    buttonColor: Colors.grey.shade200,
                    borderColor: Colors.grey.shade300,
                    labelColor: Colors.black87,
                    buttonLabel: 'Reset',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: CommonCustomButton(
                    onTap: () {
                      final currentFilter = widget.activeFilter != null
                          ? Map<String, dynamic>.from(widget.activeFilter!)
                          : <String, dynamic>{};

                      if (_selectedLookingFor != null) {
                        currentFilter['lookingFor'] = _selectedLookingFor;
                      } else {
                        currentFilter.remove('lookingFor');
                      }

                      if (_selectedSubCategory != null) {
                        currentFilter['propertyTypes'] = [_selectedSubCategory];
                      } else {
                        currentFilter['propertyTypes'] = [widget.mainCategory];
                      }

                      widget.onApply(currentFilter);
                      Navigator.pop(context);
                    },
                    buttonLabel: 'Apply Filters',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
