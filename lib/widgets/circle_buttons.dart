import 'package:flutter/material.dart';

class CircleButtons extends StatelessWidget {
  const CircleButtons({super.key, required this.iconData, required this.onTap});
  final IconData iconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: 35,
      height: 50,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(0xff8B8C9E),

      child: Icon(iconData, color: Colors.white),
    );
  }
}
