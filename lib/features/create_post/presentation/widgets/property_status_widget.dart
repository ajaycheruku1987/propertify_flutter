import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/core/constants/app_categories.dart';
import '../../bloc/create_post_bloc.dart';

class PropertyStatusWidget extends StatelessWidget {
  const PropertyStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        // Hide property status for Land & Plots category
        final isLandOrPlot = state.selectedMainCategory == 'Land & Plots' ||
            state.selectedPropertyType == 'Open Plot' ||
            state.selectedPropertyType == 'Agriculture Land' ||
            state.selectedPropertyType == 'Open Plots';

        final isSellListing = state.selectedLookingFor.toLowerCase() == 'sell' ||
            state.selectedLookingFor.toLowerCase() == 'sale';

        if (isLandOrPlot || !isSellListing) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Property Construction / Listing Status',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AppCategories.propertyStatuses.map((status) {
                final isSelected = state.selectedPropertyStatus == status;
                return ChoiceChip(
                  label: Text(status),
                  selected: isSelected,
                  selectedColor: primaryColor.withValues(alpha: 0.15),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? primaryColor : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 12,
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
                            CreatePostEvent.propertyStatusChanged(
                              propertyStatus: status,
                            ),
                          );
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
