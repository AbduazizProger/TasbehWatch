import 'dart:async';
import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer;
  TimeOfDay time = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = TimeOfDay.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          time.hour > 9 ? time.hour.toString() : '0${time.hour}',
          style: const TextStyle(
            fontSize: 135,
            color: Color.fromARGB(255, 54, 181, 244),
          ),
        ),
        const Text(
          ':',
          style: TextStyle(
            fontSize: 120,
            color: Color.fromARGB(255, 54, 181, 244),
          ),
        ),
        Text(
          time.minute > 9 ? time.minute.toString() : '0${time.minute}',
          style: const TextStyle(
            fontSize: 135,
            color: Color.fromARGB(255, 54, 181, 244),
          ),
        ),
      ],
    );
  }
}
