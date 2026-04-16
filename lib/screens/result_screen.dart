import 'package:bmi/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final Map<String, dynamic> result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 3,
        backgroundColor: Color(0xff24263B),
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Your Result',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.only(top: 58, bottom: 200, right: 33, left: 33),

            decoration: BoxDecoration(
              color: Color(0xff333244),
              borderRadius: BorderRadius.circular(25),
            ),

            child: Column(
              children: [
                Text(
                  result['category'],
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  result['bmi'],

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'You Have a ${result['category']} Body Weight,Good Job.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff8B8C9E), fontSize: 22),
                ),
              ],
            ),
          ),

          NavigationButton(
            txt: 'Re-Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
