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
              Icons.calculate_rounded,
              color: theme.primaryColor,
              size: 20,
            ),
          ),
          title: const Text(
            'EMI Calculator',
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
            // Monthly EMI Result Display
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
                    'ESTIMATED MONTHLY EMI',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currencyFormat.format(_emi),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: theme.primaryColor,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

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
