import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/create_post_bloc.dart';

class CarpetAreaInputWidget extends StatefulWidget {
  const CarpetAreaInputWidget({super.key});

  @override
  State<CarpetAreaInputWidget> createState() => _CarpetAreaInputWidgetState();
}

class _CarpetAreaInputWidgetState extends State<CarpetAreaInputWidget> {
  late TextEditingController _carpetAreaController;

  static const List<String> carpetUnits = [
    'Sq.Ft',
    'Sq.Yds',
    'Sq.Meters',
  ];

  @override
  void initState() {
    super.initState();
    final state = context.read<CreatePostBloc>().state;
    _carpetAreaController = TextEditingController(text: state.carpetArea);
  }

  @override
  void dispose() {
    _carpetAreaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        // Hide carpet area for Land & Plots category (plots use Plot Area)
        final isLandOrPlot = state.selectedMainCategory == 'Land & Plots' ||
            state.selectedPropertyType == 'Open Plot' ||
            state.selectedPropertyType == 'Agriculture Land' ||
            state.selectedPropertyType == 'Open Plots';

        if (isLandOrPlot) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Carpet Area / Built-Up Area',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _carpetAreaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'e.g. 2000',
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    onChanged: (val) {
                      context.read<CreatePostBloc>().add(
                            CreatePostEvent.carpetAreaChanged(carpetArea: val),
                          );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: carpetUnits.contains(state.selectedCarpetAreaUnit)
                            ? state.selectedCarpetAreaUnit
                            : carpetUnits.first,
                        isExpanded: true,
                        items: carpetUnits.map((unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(
                              unit,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            context.read<CreatePostBloc>().add(
                                  CreatePostEvent.carpetAreaUnitChanged(
                                    carpetAreaUnit: val,
                                  ),
                                );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Facing',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'East',
                'West',
                'North',
                'South',
                'North-East',
                'North-West',
                'South-East',
                'South-West',
                'Corner Plot',
              ].map((facing) {
                final isSelected = state.selectedFacing == facing;
                final primaryColor = Theme.of(context).primaryColor;
                return ChoiceChip(
                  label: Text(facing),
                  selected: isSelected,
                  selectedColor: primaryColor.withValues(alpha: 0.15),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? primaryColor : Colors.black87,
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color:
                          isSelected ? primaryColor : Colors.grey.shade300,
                    ),
                  ),
                  onSelected: (selected) {
                    context.read<CreatePostBloc>().add(
                          CreatePostEvent.facingChanged(
                            facing: selected ? facing : '',
                          ),
                        );
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
