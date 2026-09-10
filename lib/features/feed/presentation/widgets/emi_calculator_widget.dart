import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:propertify/l10n/app_localizations.dart';

class EmiCalculatorWidget extends StatefulWidget {
  final double propertyPrice;

  const EmiCalculatorWidget({Key? key, required this.propertyPrice})
      : super(key: key);

  @override
  State<EmiCalculatorWidget> createState() => _EmiCalculatorWidgetState();
}

class _EmiCalculatorWidgetState extends State<EmiCalculatorWidget> {
  late double _downPayment;
  late double _interestRate;
  late int _tenureYears;
  double _emi = 0;

  late TextEditingController _downPaymentController;
  late TextEditingController _interestController;
  late TextEditingController _tenureController;

  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    _downPayment = widget.propertyPrice * 0.20; // Default 20%
    _interestRate = 8.5; // Default 8.5%
    _tenureYears = 20; // Default 20 years

    _downPaymentController =
        TextEditingController(text: _downPayment.round().toString());
    _interestController =
        TextEditingController(text: _interestRate.toString());
    _tenureController = TextEditingController(text: _tenureYears.toString());

    _calculateEmi();
  }

  @override
  void dispose() {
    _downPaymentController.dispose();
    _interestController.dispose();
    _tenureController.dispose();
    super.dispose();
  }

  void _calculateEmi() {
    double principal = widget.propertyPrice - _downPayment;
    double monthlyRate = _interestRate / (12 * 100);
    int totalMonths = _tenureYears * 12;

    if (principal <= 0 || totalMonths <= 0) {
      setState(() => _emi = 0);
      return;
    }

    if (monthlyRate == 0) {
      setState(() => _emi = principal / totalMonths);
      return;
    }

    double emi =
        (principal * monthlyRate * pow(1 + monthlyRate, totalMonths)) /
        (pow(1 + monthlyRate, totalMonths) - 1);

    setState(() {
      _emi = emi;
    });
  }

  Widget _buildSliderSection({
    required String label,
    required double value,
    required double min,
    required double max,
    required TextEditingController controller,
    required String suffix,
    required ValueChanged<double> onChanged,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
            SizedBox(
              width: 100,
              height: 30,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  suffixText: ' $suffix',
                  suffixStyle: TextStyle(
                    fontSize: 12,
                    color: theme.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onChanged: (val) {
                  double? parsed = double.tryParse(val);
                  if (parsed != null) {
                    if (parsed > max) parsed = max;
                    onChanged(parsed);
                  }
                },
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
            activeTrackColor: theme.primaryColor,
            inactiveTrackColor: theme.primaryColor.withOpacity(0.1),
            thumbColor: theme.primaryColor,
          ),
          child: Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            onChanged: (val) {
              controller.text =
                  suffix == '%' || suffix == 'Yrs'
                      ? val.toStringAsFixed(1)
                      : val.round().toString();
              onChanged(val);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.propertyPrice <= 0) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.primaryColor.withOpacity(0.1)),
      ),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          leading: Icon(
            Icons.calculate_outlined,
            color: theme.primaryColor,
            size: 24,
          ),
          title: const Text(
            'Home Loan EMI Calculator',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          children: [
            const Divider(height: 1),
            const SizedBox(height: 20),
            // Monthly EMI Result Display
            Center(
              child: Column(
                children: [
                  Text(
                    'Estimated Monthly EMI',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _currencyFormat.format(_emi),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),

            // Principal Amount Info
            _buildInfoRow(
              'Loan Amount',
              _currencyFormat.format(
                (widget.propertyPrice - _downPayment).clamp(
                  0,
                  widget.propertyPrice,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Down Payment Slider & Input
            _buildSliderSection(
              label: 'Down Payment',
              value: _downPayment,
              min: 0,
              max: widget.propertyPrice,
              controller: _downPaymentController,
              suffix: '',
              onChanged: (val) {
                setState(() => _downPayment = val);
                _calculateEmi();
              },
            ),

            // Interest Rate Slider & Input
            _buildSliderSection(
              label: 'Interest Rate',
              value: _interestRate,
              min: 5,
              max: 20,
              controller: _interestController,
              suffix: '%',
              onChanged: (val) {
                setState(() => _interestRate = val);
                _calculateEmi();
              },
            ),

            // Tenure Slider & Input
            _buildSliderSection(
              label: 'Tenure',
              value: _tenureYears.toDouble(),
              min: 1,
              max: 30,
              controller: _tenureController,
              suffix: 'Yrs',
              onChanged: (val) {
                setState(() => _tenureYears = val.toInt());
                _calculateEmi();
              },
            ),

            const SizedBox(height: 8),
            Text(
              '*This is an estimate. Actual rates may vary by bank.',
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
