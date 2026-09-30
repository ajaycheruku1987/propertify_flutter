import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/l10n/app_localizations.dart';
import '../../bloc/create_post_bloc.dart';

class PlotDetailsInput extends StatefulWidget {
  const PlotDetailsInput({super.key});

  @override
  State<PlotDetailsInput> createState() => _PlotDetailsInputState();
}

class _PlotDetailsInputState extends State<PlotDetailsInput> {
  late TextEditingController _areaController;
  late TextEditingController _roadWidthController;
  late TextEditingController _dimensionsController;

  static const List<String> areaUnits = [
    'Sq.Yds',
    'Sq.Ft',
    'Acres',
    'Cents',
    'Gunthas',
  ];

  static const List<String> facings = [
    'East',
    'West',
    'North',
    'South',
    'North-East',
    'North-West',
    'South-East',
    'South-West',
    'Corner Plot',
  ];

  static const List<String> postedByRoles = [
    'Owner',
    'Agent',
    'Builder',
  ];

  static const List<String> approvalStatuses = [
    'HMDA Approved',
    'DTCP Approved',
    'RERA Approved',
    'Gram Panchayat',
    'Clear Title',
    'Unapproved / Layout',
    'Others',
  ];

  @override
  void initState() {
    super.initState();
    final state = context.read<CreatePostBloc>().state;
    _areaController = TextEditingController(text: state.plotArea);
    _roadWidthController = TextEditingController(text: state.roadWidth);
    _dimensionsController = TextEditingController(text: state.dimensions);
  }

  @override
  void dispose() {
    _areaController.dispose();
    _roadWidthController.dispose();
    _dimensionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        // Show plot details only for plot/land categories
        final isPlotOrLand = state.selectedPropertyType == 'Open Plot' ||
            state.selectedPropertyType == 'Agriculture Land' ||
            state.selectedPropertyType == 'Open Plots';

        if (!isPlotOrLand) {
          return const SizedBox.shrink();
        }

        final primaryColor = Theme.of(context).primaryColor;

        return Container(
          margin: const EdgeInsets.only(top: 8, bottom: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Badge
              Row(
                children: [
                  Icon(Icons.landscape_rounded, color: primaryColor, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    'Plot & Land Specifications',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 1. Plot Area & Unit
              Text(
                'Plot / Land Area',
                style: const TextStyle(
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
                      controller: _areaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'e.g. 200',
                        filled: true,
                        fillColor: Colors.white,
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
                        context
                            .read<CreatePostBloc>()
                            .add(CreatePostEvent.plotAreaChanged(plotArea: val));
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
                          value: areaUnits.contains(state.selectedAreaUnit)
                              ? state.selectedAreaUnit
                              : areaUnits.first,
                          isExpanded: true,
                          items: areaUnits.map((unit) {
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
                                    CreatePostEvent.areaUnitChanged(
                                      areaUnit: val,
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

              // 2. Facing
              const Text(
                'Plot Facing',
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
                children: facings.map((facing) {
                  final isSelected = state.selectedFacing == facing;
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

              const SizedBox(height: 16),

              // 3. Approach Road Size
              const Text(
                'Approach Road Width (Feet)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _roadWidthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'e.g. 40 Ft Road',
                  filled: true,
                  fillColor: Colors.white,
                  suffixText: 'Ft',
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
                  context
                      .read<CreatePostBloc>()
                      .add(CreatePostEvent.roadWidthChanged(roadWidth: val));
                },
              ),

              const SizedBox(height: 16),

              // 4. Posted By Role
              const Text(
                'I am an',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: postedByRoles.map((role) {
                  final isSelected = state.selectedPostedBy == role;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(role),
                      selected: isSelected,
                      selectedColor: primaryColor.withValues(alpha: 0.15),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? primaryColor : Colors.black87,
                        fontSize: 13,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color:
                              isSelected ? primaryColor : Colors.grey.shade300,
                        ),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          context.read<CreatePostBloc>().add(
                                CreatePostEvent.postedByChanged(
                                  postedBy: role,
                                ),
                              );
                        }
                      },
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              // 5. Approvals / Permissions
              const Text(
                'Approval / Legal Status',
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
                children: approvalStatuses.map((status) {
                  final isSelected = state.selectedApprovalStatus == status;
                  return ChoiceChip(
                    label: Text(status),
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
                            CreatePostEvent.approvalStatusChanged(
                              approvalStatus: selected ? status : '',
                            ),
                          );
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              // 6. Dimensions
              const Text(
                'Plot Dimensions (Optional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _dimensionsController,
                decoration: InputDecoration(
                  hintText: 'e.g. 30 ft x 50 ft',
                  filled: true,
                  fillColor: Colors.white,
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
                  context
                      .read<CreatePostBloc>()
                      .add(CreatePostEvent.dimensionsChanged(dimensions: val));
                },
              ),

              const SizedBox(height: 16),

              // 7. Additional Toggles
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      dense: true,
                      title: const Text(
                        'Corner Plot',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: state.isCornerPlot,
                      activeColor: primaryColor,
                      onChanged: (val) {
                        context.read<CreatePostBloc>().add(
                              CreatePostEvent.isCornerPlotChanged(
                                isCornerPlot: val,
                              ),
                            );
                      },
                    ),
                    Divider(height: 1, color: Colors.grey.shade200),
                    SwitchListTile(
                      dense: true,
                      title: const Text(
                        'Gated Community / Boundary Wall',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: state.isGatedCommunity,
                      activeColor: primaryColor,
                      onChanged: (val) {
                        context.read<CreatePostBloc>().add(
                              CreatePostEvent.isGatedCommunityChanged(
                                isGatedCommunity: val,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
