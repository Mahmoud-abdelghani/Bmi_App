import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, required this.txt, required this.onTap});
  final String txt;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30),
      color: Color(0xffE83D67),
      child: Text(
        txt,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
