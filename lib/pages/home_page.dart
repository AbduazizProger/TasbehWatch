import 'package:car_helper/components/battery_widget.dart';
import 'package:car_helper/components/clock_widget.dart';
import 'package:car_helper/components/day_widget.dart';
import 'package:car_helper/pages/tools_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                DayWidget(),
                ClockWidget(),
                BatteryWidget(),
              ],
            ),
            ToolsPage(),
          ],
        ),
      ),
    );
  }
}
