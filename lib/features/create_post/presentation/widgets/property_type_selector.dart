import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/create_post_bloc.dart';

class PropertyTypeSelector extends StatelessWidget {
  const PropertyTypeSelector({super.key});

  final List<Map<String, dynamic>> propertyTypes = const [
    {'name': 'Villas', 'icon': Icons.villa_outlined},
    {'name': 'Apartments', 'icon': Icons.apartment_outlined},
    {'name': 'Open Plot', 'icon': Icons.business_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Property Type *',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: propertyTypes.map((type) {
                final isSelected = state.selectedPropertyType == type['name'];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<CreatePostBloc>().add(
                        CreatePostEvent.propertyTypeChanged(
                          propertyType: type['name'],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: isSelected
                          //     ? Theme.of(context).primaryColor.withOpacity(0.1)
                          //     : Colors.grey.shade50,
                          gradient: isSelected
                              ? LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context).primaryColor,
                                    Theme.of(
                                      context,
                                    ).primaryColor.withOpacity(0.2),
                                    Theme.of(
                                      context,
                                    ).primaryColor.withOpacity(0.2),
                                  ],
                                )
                              : null,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : Theme.of(context).hintColor.withOpacity(0.2),
                            // width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE4D7FF)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  type['icon'],
                                  size: 24,
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade600,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  type['name'],
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey.shade700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            if (state.selectedPropertyType.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Property type is required',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
