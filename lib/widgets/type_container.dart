import 'package:flutter/material.dart';

class TypeContainer extends StatelessWidget {
  const TypeContainer({
    super.key,
    required this.txt,
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  });
  final String txt;
  final IconData iconData;
  final bool isSelected;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 24, left: 29, right: 29, bottom: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Color(0xff24263B) : Color(0xff333244),
        ),
        child: Column(
          children: [
            Icon(iconData, color: Colors.white, size: 130),
            Text(txt, style: TextStyle(color: Color(0xff8B8C9E), fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
