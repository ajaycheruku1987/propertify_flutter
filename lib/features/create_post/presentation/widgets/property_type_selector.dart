import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/core/constants/app_categories.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../bloc/create_post_bloc.dart';

class PropertyTypeSelector extends StatelessWidget {
  const PropertyTypeSelector({super.key});

  final List<Map<String, dynamic>> propertyTypes = AppCategories.propertyTypeForProject;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${l10n.propertyType} *',
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
              children: propertyTypes.map((type) {
                final isSelected = state.selectedPropertyType == type['name'];
                return GestureDetector(
                  onTap: () {
                    context.read<CreatePostBloc>().add(
                          CreatePostEvent.propertyTypeChanged(
                            propertyType: type['name'],
                          ),
                        );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
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
            if (state.selectedPropertyType.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  l10n.propertyTypeRequired,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
