import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodySimScreen extends StatefulWidget {
  const BodySimScreen({super.key});

  @override
  State<BodySimScreen> createState() => _BodySimScreenState();
}

class _BodySimScreenState extends State<BodySimScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('BodySimScreen'),
      ),
    );
  }
}