import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/common_widgets/common_dropdown.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../bloc/sales_bloc.dart';
import '../../models/sales_model.dart';
import '../../models/sales_unit_model.dart';

class AddEditUnitBottomSheet extends StatefulWidget {
  final SaleRecord sale;
  final SalesUnitModel? unit;

  const AddEditUnitBottomSheet({super.key, required this.sale, this.unit});

  static void show(
    BuildContext context,
    SaleRecord sale, [
    SalesUnitModel? unit,
  ]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddEditUnitBottomSheet(sale: sale, unit: unit),
      ),
    );
  }

  @override
  State<AddEditUnitBottomSheet> createState() => _AddEditUnitBottomSheetState();
}

class _AddEditUnitBottomSheetState extends State<AddEditUnitBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  String? _floor;
  final _unitNumberController = TextEditingController();
  String? _bhkQty;
  final _areaController = TextEditingController();
  String? _measurement;
  final _priceController = TextEditingController();
  String? _status;
  String? _facing;
  String? _villaType;

  late String _propertyType;

  @override
  void initState() {
    super.initState();
    _propertyType = widget.sale.propertyType?.toLowerCase().trim() ?? '';

    if (widget.unit != null) {
      if (widget.unit!.floor != null) _floor = widget.unit!.floor.toString();
      _unitNumberController.text = widget.unit!.unitNumber ?? '';
      if (widget.unit!.bhkQty != null) _bhkQty = '${widget.unit!.bhkQty} bhk';
      if (widget.unit!.area != null)
        _areaController.text = widget.unit!.area.toString();
      _measurement = widget.unit!.measurement;
      if (widget.unit!.price != null)
        _priceController.text = widget.unit!.price.toString();
      _status = widget.unit!.status;
      _facing = widget.unit!.facing;
      _villaType = widget.unit!.villaType;
    } else {
      _status = 'Available';
    }
  }

  @override
  void dispose() {
    _unitNumberController.dispose();
    _areaController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool get _isApartment => _propertyType.contains('apartment');
  bool get _isVilla => _propertyType.contains('villa');
  bool get _isOpenPlot => _propertyType.contains('plot');

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final data = <String, dynamic>{
        'unit_type': _propertyType,
        'unit_number': _unitNumberController.text.trim(),
        'area': num.tryParse(_areaController.text.trim()) ?? 0,
        'measurement': _measurement,
        'price': num.tryParse(_priceController.text.trim()) ?? 0,
        'status': _status,
        'facing': _facing,
      };

      if (_isApartment) {
        data['floor'] = int.tryParse(_floor ?? '0') ?? 0;
        data['bhk_qty'] = int.tryParse(_bhkQty?.split(' ').first ?? '0') ?? 0;
      } else if (_isVilla) {
        data['villa_type'] = _villaType;
      }

      if (widget.unit == null) {
        context.read<SalesBloc>().add(
          SalesEvent.addProjectUnit(projectId: widget.sale.id!, data: data),
        );
      } else {
        context.read<SalesBloc>().add(
          SalesEvent.editProjectUnit(
            unitId: widget.unit!.id!,
            projectId: widget.sale.id!,
            data: data,
          ),
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String unitNumberLabel = 'Unit No';
    if (_isApartment) unitNumberLabel = 'Flat No';
    if (_isVilla) unitNumberLabel = 'Villa No';
    if (_isOpenPlot) unitNumberLabel = 'Plot No';

    List<String> getFloors() {
      // Assuming noOfFloors implies up to that floor
      int maxFloors = 20;
      return List.generate(maxFloors + 1, (index) => index.toString());
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.unit == null
                    ? 'Add $unitNumberLabel'
                    : 'Edit $unitNumberLabel',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (_isApartment) ...[
                CommonDropdownFormField<String>(
                  label: 'Floor',
                  hintText: 'Select Floor',
                  value: _floor,
                  items: getFloors()
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _floor = val),
                  isRequired: true,
                ),
                const SizedBox(height: 12),
              ],
              CommonTextFormField(
                label: unitNumberLabel,
                hintText: 'Enter $unitNumberLabel',
                controller: _unitNumberController,
                isRequired: true,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              if (_isApartment) ...[
                CommonDropdownFormField<String>(
                  label: 'BHK Type',
                  hintText: 'Select BHK',
                  value: _bhkQty,
                  items: ['1 bhk', '2 bhk', '3 bhk', '4 bhk', '5 bhk']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _bhkQty = val),
                  isRequired: true,
                ),
                const SizedBox(height: 12),
              ],
              CommonTextFormField(
                label: 'Built Area',
                hintText: 'Enter Built Area',
                controller: _areaController,
                isRequired: true,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              CommonDropdownFormField<String>(
                label: 'Measurement',
                hintText: 'Select Unit',
                value: _measurement,
                items: ['SqFts', 'SqYards', 'Acres']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _measurement = val),
                isRequired: true,
              ),
              const SizedBox(height: 12),
              CommonTextFormField(
                label: 'Price',
                hintText: 'Enter Price',
                controller: _priceController,
                isRequired: true,
                keyboardType: TextInputType.number,
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              CommonDropdownFormField<String>(
                label: 'Status',
                hintText: 'Select Status',
                value: _status,
                items: ['Available', 'Sold']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _status = val),
                isRequired: true,
              ),
              const SizedBox(height: 12),
              CommonDropdownFormField<String>(
                label: 'Facing',
                hintText: 'Select Facing',
                value: _facing,
                items: ['East', 'West', 'North', 'South']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => _facing = val),
                isRequired: true,
              ),
              const SizedBox(height: 12),
              if (_isVilla) ...[
                CommonDropdownFormField<String>(
                  label: 'Villa Type',
                  hintText: 'Select Villa Type',
                  value: _villaType,
                  items: ['Duplex', 'Triplex']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _villaType = val),
                  isRequired: true,
                ),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 20),
              CommonCustomButton(
                onTap: _submit,
                buttonLabel: widget.unit == null ? 'Add' : 'Save',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
