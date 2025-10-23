import 'dart:async';

import 'package:flutter/material.dart';

class TimeCountdown extends StatefulWidget {
  final int seconds;
  final VoidCallback onTimeUp;
  const TimeCountdown({
    super.key,
    required this.seconds,
    required this.onTimeUp,
  });

  @override
  State<TimeCountdown> createState() => _TimeCountdownState();
}

class _TimeCountdownState extends State<TimeCountdown> {
  late int remainingSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds == 0) {
          timer.cancel();
          widget.onTimeUp(); // Call the callback function
        } else {
          remainingSeconds--;
        }
      });
    });
  }

  String formatTime(int seconds) {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(remainingSeconds),
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
