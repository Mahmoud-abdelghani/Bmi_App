import 'package:bmi/widgets/circle_buttons.dart';
import 'package:flutter/material.dart';

class NumericalContainers extends StatelessWidget {
  const NumericalContainers({
    super.key,
    required this.txt,
    required this.value,
    required this.onTapPlus,
    required this.onTapminus,
  });
  final String txt;
  final int value;
  final VoidCallback onTapPlus;
  final VoidCallback onTapminus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 17, bottom: 26, left: 17, right: 17),
      decoration: BoxDecoration(
        color: Color(0xff24263B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(txt, style: TextStyle(color: Color(0xff8B8C9E), fontSize: 22)),
          Text(
            value.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 21),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleButtons(iconData: Icons.add, onTap: onTapPlus),
              SizedBox(width: 42),
              CircleButtons(iconData: Icons.remove, onTap: onTapminus),
            ],
          ),
        ],
      ),
    );
  }
}
