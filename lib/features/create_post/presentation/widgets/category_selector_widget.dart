import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/core/constants/app_categories.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../bloc/create_post_bloc.dart';

class CategorySelectorWidget extends StatelessWidget {
  const CategorySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        final mainCategories = AppCategories.propertyCategoryHierarchy.keys.toList();
        final currentMain = mainCategories.contains(state.selectedMainCategory)
            ? state.selectedMainCategory
            : mainCategories.first;

        final subCategories = AppCategories.propertyCategoryHierarchy[currentMain] ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Main Category Header
            const Text(
              'Property Category *',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Main Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: mainCategories.map((mainCat) {
                  final isSelected = currentMain == mainCat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(mainCat),
                      selected: isSelected,
                      selectedColor: primaryColor.withValues(alpha: 0.15),
                      backgroundColor: Colors.grey.shade100,
                      labelStyle: TextStyle(
                        color: isSelected ? primaryColor : Colors.grey.shade800,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        fontSize: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isSelected ? primaryColor : Colors.grey.shade300,
                        ),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          context.read<CreatePostBloc>().add(
                                CreatePostEvent.mainCategoryChanged(
                                  mainCategory: mainCat,
                                ),
                              );
                          // Auto select first subcategory
                          final defaultSub =
                              AppCategories.propertyCategoryHierarchy[mainCat]?.first ?? '';
                          context.read<CreatePostBloc>().add(
                                CreatePostEvent.subCategoryChanged(
                                  subCategory: defaultSub,
                                ),
                              );
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // 2. Sub-Category Header
            Text(
              '$currentMain Types *',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Sub Category Wrap
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: subCategories.map((subCat) {
                final isSelected = state.selectedSubCategory == subCat ||
                    state.selectedPropertyType == subCat;
                return ChoiceChip(
                  label: Text(subCat.translate(context)),
                  selected: isSelected,
                  selectedColor: primaryColor.withValues(alpha: 0.15),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? primaryColor : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: isSelected ? primaryColor : Colors.grey.shade300,
                    ),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      context.read<CreatePostBloc>().add(
                            CreatePostEvent.subCategoryChanged(
                              subCategory: subCat,
                            ),
                          );
                    }
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
