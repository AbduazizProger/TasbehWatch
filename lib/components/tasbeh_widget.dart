import 'package:flutter/material.dart';

class TasbehWidget extends StatelessWidget {
  const TasbehWidget({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      counter.toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: counter.toString().length >= 5
            ? 100
            : counter.toString().length >= 4
                ? 130
                : 150,
      ),
    );
  }
}
