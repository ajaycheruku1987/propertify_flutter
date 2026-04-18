import 'dart:async';
import 'package:flutter/material.dart';

class CountdownResendButton extends StatefulWidget {
  final VoidCallback onResend;

  const CountdownResendButton({Key? key, required this.onResend})
    : super(key: key);

  @override
  State<CountdownResendButton> createState() => _CountdownResendButtonState();
}

class _CountdownResendButtonState extends State<CountdownResendButton> {
  static const int _initialSeconds = 30;
  int _secondsLeft = _initialSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() => _secondsLeft = _initialSeconds);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 1) {
        setState(() => _secondsLeft--);
      } else {
        setState(() => _secondsLeft = 0);
        _timer?.cancel();
      }
    });
  }

  String get _formattedTime {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _secondsLeft == 0
            ? const IgnorePointer()
            : Text(
                _formattedTime,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        // const SizedBox(height: 10),
        TextButton(
          onPressed: _secondsLeft == 0
              ? () {
                  widget.onResend();
                  _startTimer();
                }
              : null,
          child: Text(
            "Resend OTP",
            style: TextStyle(
              color: _secondsLeft == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
