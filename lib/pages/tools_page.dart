import 'package:car_helper/components/tasbeh_widget.dart';
import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter++;
        });
      },
      onScaleEnd: (details) {
        setState(() {
          _counter = 0;
        });
      },
      child: Container(
        width: 320,
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(child: TasbehWidget(counter: _counter)),
      ),
    );
  }
}
