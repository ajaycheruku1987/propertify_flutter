import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../domain/area_unit.dart';

class ConversionCalculatorScreen extends StatefulWidget {
  static const String routeName = '/conversion-calculator';

  const ConversionCalculatorScreen({super.key});

  @override
  State<ConversionCalculatorScreen> createState() =>
      _ConversionCalculatorScreenState();
}

class _ConversionCalculatorScreenState extends State<ConversionCalculatorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Unit Converter State
  final TextEditingController _unitValueController =
      TextEditingController(text: '1');
  AreaUnit _fromUnit = AreaUnit.sqYd;
  AreaUnit _toUnit = AreaUnit.sqFt;

  // Plot Dimension State
  final TextEditingController _lengthController =
      TextEditingController(text: '30');
  final TextEditingController _widthController =
      TextEditingController(text: '40');
  LengthUnit _dimensionUnit = LengthUnit.feet;

  // Price Estimator State
  final TextEditingController _areaController =
      TextEditingController(text: '100');
  AreaUnit _priceAreaUnit = AreaUnit.sqYd;
  final TextEditingController _rateController =
      TextEditingController(text: '5000');

  final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _unitValueController.dispose();
    _lengthController.dispose();
    _widthController.dispose();
    _areaController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  double get _unitInputValue =>
      double.tryParse(_unitValueController.text) ?? 0.0;

  double get _convertedValue =>
      _fromUnit.convertTo(_unitInputValue, _toUnit);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Property Calculator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        bottom: TabBar(
          controller: _tabController,
          labelColor: theme.primaryColor,
          unselectedLabelColor: Colors.grey.shade600,
          indicatorColor: theme.primaryColor,
          indicatorWeight: 3,
          tabs: const [
            Tab(icon: Icon(Icons.swap_horiz), text: 'Unit Converter'),
            Tab(icon: Icon(Icons.aspect_ratio), text: 'Plot Area'),
            Tab(icon: Icon(Icons.calculate_outlined), text: 'Price Estimator'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUnitConverterTab(theme),
          _buildPlotAreaTab(theme),
          _buildPriceEstimatorTab(theme),
        ],
      ),
    );
  }

  // ==========================================
  // TAB 1: UNIT CONVERTER
  // ==========================================
  Widget _buildUnitConverterTab(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Preset Chips
          const Text(
            'Quick Presets',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildPresetChip('1 Sq Yd → Sq Ft', AreaUnit.sqYd, AreaUnit.sqFt, 1),
                _buildPresetChip('1 Acre → Sq Ft', AreaUnit.acre, AreaUnit.sqFt, 1),
                _buildPresetChip('1 Acre → Guntha', AreaUnit.acre, AreaUnit.guntha, 1),
                _buildPresetChip('1 Guntha → Sq Ft', AreaUnit.guntha, AreaUnit.sqFt, 1),
                _buildPresetChip('1 Bigha → Sq Yd', AreaUnit.bigha, AreaUnit.sqYd, 1),
                _buildPresetChip('100 Sq Yd', AreaUnit.sqYd, AreaUnit.sqFt, 100),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Main Converter Card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // From Unit Section
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('From', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            DropdownButton<AreaUnit>(
                              isExpanded: true,
                              value: _fromUnit,
                              underline: const SizedBox(),
                              items: AreaUnit.values.map((unit) {
                                return DropdownMenuItem(
                                  value: unit,
                                  child: Text(
                                    unit.displayName,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _fromUnit = val;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Value Input
                  TextField(
                    controller: _unitValueController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter Value',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      suffixText: _fromUnit.symbol,
                    ),
                    onChanged: (_) => setState(() {}),
                  ),

                  const SizedBox(height: 16),

                  // Swap Button
                  Center(
                    child: IconButton.filledTonal(
                      icon: const Icon(Icons.swap_vert, size: 28),
                      onPressed: () {
                        setState(() {
                          final temp = _fromUnit;
                          _fromUnit = _toUnit;
                          _toUnit = temp;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // To Unit Section
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('To', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            DropdownButton<AreaUnit>(
                              isExpanded: true,
                              value: _toUnit,
                              underline: const SizedBox(),
                              items: AreaUnit.values.map((unit) {
                                return DropdownMenuItem(
                                  value: unit,
                                  child: Text(
                                    unit.displayName,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _toUnit = val;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Result Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Converted Result',
                          style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        SelectableText(
                          '${_formatNumber(_convertedValue)} ${_toUnit.shortName}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '1 ${_fromUnit.shortName} = ${_formatNumber(_fromUnit.convertTo(1, _toUnit))} ${_toUnit.shortName}',
                          style: const TextStyle(fontSize: 11, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // All Conversions Summary Breakdown
          if (_unitInputValue > 0) ...[
            Text(
              'Equivalent Values for ${_formatNumber(_unitInputValue)} ${_fromUnit.shortName}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: AreaUnit.values.where((u) => u != _fromUnit).map((unit) {
                  final converted = _fromUnit.convertTo(_unitInputValue, unit);
                  return ListTile(
                    dense: true,
                    title: Text(unit.displayName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    trailing: Text(
                      '${_formatNumber(converted)} ${unit.shortName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: theme.primaryColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPresetChip(String label, AreaUnit from, AreaUnit to, double value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        label: Text(label, style: const TextStyle(fontSize: 12)),
        backgroundColor: Colors.grey.shade100,
        onPressed: () {
          setState(() {
            _fromUnit = from;
            _toUnit = to;
            _unitValueController.text = value.toString();
          });
        },
      ),
    );
  }

  // ==========================================
  // TAB 2: PLOT AREA CALCULATOR
  // ==========================================
  Widget _buildPlotAreaTab(ThemeData theme) {
    final length = double.tryParse(_lengthController.text) ?? 0.0;
    final width = double.tryParse(_widthController.text) ?? 0.0;

    final lengthInFeet = _dimensionUnit.toFeet(length);
    final widthInFeet = _dimensionUnit.toFeet(width);
    final totalSqFt = lengthInFeet * widthInFeet;

    final totalSqYd = AreaUnit.sqFt.convertTo(totalSqFt, AreaUnit.sqYd);
    final totalSqM = AreaUnit.sqFt.convertTo(totalSqFt, AreaUnit.sqM);
    final totalGuntha = AreaUnit.sqFt.convertTo(totalSqFt, AreaUnit.guntha);
    final totalAcre = AreaUnit.sqFt.convertTo(totalSqFt, AreaUnit.acre);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Plot Dimensions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Dimension Unit Selector
                  Row(
                    children: [
                      const Text('Dimension Unit: ', style: TextStyle(fontSize: 13)),
                      const Spacer(),
                      DropdownButton<LengthUnit>(
                        value: _dimensionUnit,
                        items: LengthUnit.values.map((unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _dimensionUnit = val;
                            });
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _lengthController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Length',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('✕', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _widthController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Width',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Summary Result Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Calculated Plot Area',
                          style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildResultMetric('Sq Yards (Gaj)', '${_formatNumber(totalSqYd)} sq yd', theme),
                            _buildResultMetric('Square Feet', '${_formatNumber(totalSqFt)} sq ft', theme),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildResultMetric('Guntha', '${_formatNumber(totalGuntha)} gth', theme),
                            _buildResultMetric('Acres', '${_formatNumber(totalAcre)} ac', theme),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultMetric(String title, String value, ThemeData theme) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 11, color: Colors.black54)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  // ==========================================
  // TAB 3: PRICE & RATE ESTIMATOR
  // ==========================================
  Widget _buildPriceEstimatorTab(ThemeData theme) {
    final areaVal = double.tryParse(_areaController.text) ?? 0.0;
    final rateVal = double.tryParse(_rateController.text) ?? 0.0;

    final totalPrice = areaVal * rateVal;

    // Converted rates
    final areaInSqFt = _priceAreaUnit.convertTo(areaVal, AreaUnit.sqFt);
    final ratePerSqFt = areaInSqFt > 0 ? totalPrice / areaInSqFt : 0.0;
    final ratePerSqYd = areaInSqFt > 0 ? totalPrice / AreaUnit.sqFt.convertTo(areaInSqFt, AreaUnit.sqYd) : 0.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Property Valuation Estimator',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Area input with unit dropdown
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: _areaController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Total Area',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField<AreaUnit>(
                          value: _priceAreaUnit,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          ),
                          items: AreaUnit.values.map((unit) {
                            return DropdownMenuItem(
                              value: unit,
                              child: Text(unit.shortName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _priceAreaUnit = val;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Rate per unit
                  TextField(
                    controller: _rateController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Rate per ${_priceAreaUnit.displayName}',
                      prefixText: '₹ ',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),

                  const SizedBox(height: 20),

                  // Calculated Total Price Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Estimated Total Property Value',
                          style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        SelectableText(
                          _currencyFormatter.format(totalPrice),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                        if (totalPrice > 0) ...[
                          const SizedBox(height: 4),
                          Text(
                            _formatIndianCurrencyWords(totalPrice),
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Rate Breakdown
          if (totalPrice > 0) ...[
            const Text(
              'Effective Rate Breakdown',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Rate per Square Foot', style: TextStyle(fontSize: 13)),
                    trailing: Text(
                      '₹ ${_formatNumber(ratePerSqFt)} / sq ft',
                      style: TextStyle(fontWeight: FontWeight.bold, color: theme.primaryColor),
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text('Rate per Square Yard (Gaj)', style: TextStyle(fontSize: 13)),
                    trailing: Text(
                      '₹ ${_formatNumber(ratePerSqYd)} / sq yd',
                      style: TextStyle(fontWeight: FontWeight.bold, color: theme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatNumber(double val) {
    if (val == 0) return '0';
    if (val >= 10000000) {
      return NumberFormat('#,##,##,##0.##').format(val);
    }
    return NumberFormat('#,##0.##').format(val);
  }

  String _formatIndianCurrencyWords(double val) {
    if (val >= 10000007) {
      final crores = val / 10000000;
      return 'Approx. ₹ ${crores.toStringAsFixed(2)} Crores';
    } else if (val >= 100000) {
      final lakhs = val / 100000;
      return 'Approx. ₹ ${lakhs.toStringAsFixed(2)} Lakhs';
    } else if (val >= 1000) {
      final thousands = val / 1000;
      return 'Approx. ₹ ${thousands.toStringAsFixed(2)} Thousand';
    }
    return '';
  }
}
