import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StampDutyCalculatorWidget extends StatefulWidget {
  final double propertyPrice;

  const StampDutyCalculatorWidget({Key? key, required this.propertyPrice})
      : super(key: key);

  @override
  State<StampDutyCalculatorWidget> createState() =>
      _StampDutyCalculatorWidgetState();
}

class _StampDutyCalculatorWidgetState extends State<StampDutyCalculatorWidget> {
  String _selectedState = 'Maharashtra';
  String _buyerGender = 'Male';
  double _stampDutyPercent = 5.0;
  double _registrationPercent = 1.0;

  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  final Map<String, Map<String, double>> _stateRates = {
    'Maharashtra': {'stamp': 5.0, 'reg': 1.0, 'femaleDiscount': 1.0},
    'Karnataka': {'stamp': 3.0, 'reg': 1.0, 'femaleDiscount': 0.0},
    'Delhi': {'stamp': 6.0, 'reg': 1.0, 'femaleDiscount': 2.0},
    'Tamil Nadu': {'stamp': 7.0, 'reg': 2.0, 'femaleDiscount': 0.0},
    'Telangana': {'stamp': 5.0, 'reg': 0.5, 'femaleDiscount': 0.0},
    'Uttar Pradesh': {'stamp': 7.0, 'reg': 1.0, 'femaleDiscount': 1.0},
    'Other / Average': {'stamp': 5.0, 'reg': 1.0, 'femaleDiscount': 0.5},
  };

  @override
  void initState() {
    super.initState();
    _updateRatesForState(_selectedState);
  }

  void _updateRatesForState(String state) {
    final rates = _stateRates[state] ?? _stateRates['Other / Average']!;
    double baseStamp = rates['stamp']!;
    if (_buyerGender == 'Female') {
      baseStamp = (baseStamp - (rates['femaleDiscount'] ?? 0)).clamp(0.0, 10.0);
    }
    setState(() {
      _selectedState = state;
      _stampDutyPercent = baseStamp;
      _registrationPercent = rates['reg']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.propertyPrice <= 0) return const SizedBox.shrink();

    double stampDutyAmount = widget.propertyPrice * (_stampDutyPercent / 100);
    double registrationAmount =
        widget.propertyPrice * (_registrationPercent / 100);
    double totalTaxes = stampDutyAmount + registrationAmount;
    double grandTotal = widget.propertyPrice + totalTaxes;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.primaryColor.withOpacity(0.05)),
      ),
      child: Theme(
        data: theme.copyWith(
          dividerColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.receipt_long_rounded,
              color: theme.primaryColor,
              size: 20,
            ),
          ),
          title: const Text(
            'Stamp Duty & Registration',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.5,
            ),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          children: [
            const SizedBox(height: 10),
            // Total Tax Result Display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'ESTIMATED GOVT. TAXES (STAMP + REG)',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currencyFormat.format(totalTaxes),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: theme.primaryColor,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Effective Total: ${_currencyFormat.format(grandTotal)}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // State Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'State / Region',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedState,
                    underline: const SizedBox.shrink(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                    items: _stateRates.keys.map((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _updateRatesForState(newValue);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Buyer Gender Selector (Concessions)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Primary Buyer',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                ToggleButtons(
                  isSelected: [_buyerGender == 'Male', _buyerGender == 'Female'],
                  onPressed: (int index) {
                    setState(() {
                      _buyerGender = index == 0 ? 'Male' : 'Female';
                      _updateRatesForState(_selectedState);
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: theme.primaryColor,
                  color: Colors.black87,
                  constraints: const BoxConstraints(minWidth: 70, minHeight: 32),
                  children: const [
                    Text('General', style: TextStyle(fontSize: 12)),
                    Text('Female', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Breakdown
            _buildInfoRow('Stamp Duty (${_stampDutyPercent.toStringAsFixed(1)}%)',
                _currencyFormat.format(stampDutyAmount)),
            const SizedBox(height: 12),
            _buildInfoRow(
                'Registration Fee (${_registrationPercent.toStringAsFixed(1)}%)',
                _currencyFormat.format(registrationAmount)),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            _buildInfoRow('Total Property Cost',
                _currencyFormat.format(grandTotal), isBold: true),

            const SizedBox(height: 12),
            Text(
              '*Stamp duty rates vary by municipal limits, urban/rural status, and exact property sub-type.',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: isBold ? Colors.black87 : Colors.grey.shade700,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.w800,
            color: isBold ? Theme.of(context).primaryColor : Colors.black,
          ),
        ),
      ],
    );
  }
}
