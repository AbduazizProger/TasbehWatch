import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/enums/charging_status.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

class BatteryWidget extends StatefulWidget {
  const BatteryWidget({super.key});

  @override
  State<BatteryWidget> createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  int batteryLevel = 0;
  AndroidBatteryInfo androidBatteryInfo = AndroidBatteryInfo();
  @override
  void initState() {
    super.initState();
    BatteryInfoPlugin().androidBatteryInfoStream.listen((batteryInfo) {
      androidBatteryInfo = batteryInfo!;
      setState(() {
        batteryLevel = batteryInfo.batteryLevel ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$batteryLevel %',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blue, width: 4),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 0.5 * batteryLevel,
                          color: Colors.white,
                        ),
                        Container(
                          height: 25,
                          width: 0.5 * (100 - batteryLevel),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 13,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            androidBatteryInfo.chargingStatus == ChargingStatus.Charging
                ? const Icon(
                    Icons.bolt,
                    color: Colors.amber,
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
