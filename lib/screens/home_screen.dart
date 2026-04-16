import 'dart:developer';

import 'package:bmi/screens/result_screen.dart';

import 'package:bmi/widgets/navigation_button.dart';
import 'package:bmi/widgets/numerical_containers.dart';
import 'package:bmi/widgets/type_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGender = '';
  double height = 100;
  int weight = 50;
  int age = 20;
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
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TypeContainer(
                txt: 'Male',
                iconData: Icons.male,
                isSelected: selectedGender == 'Male',
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                },
              ),
              TypeContainer(
                txt: 'Female',
                iconData: Icons.female,
                isSelected: selectedGender == 'Female',
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 27, bottom: 45),
            margin: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Color(0xff333244),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'Height',
                  style: TextStyle(
                    color: Color(0xff8B8C9E),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: height.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' cm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),

                Slider.adaptive(
                  thumbColor: Colors.black,
                  activeColor: Color(0xffE83D67),
                  min: 50,
                  max: 300,
                  value: height,
                  onChanged: (value) {
                    height = value;
                    log(value.toStringAsFixed(2));
                    setState(() {});
                  },
                ),

                // CupertinoSlider(

                //   activeColor: Color(0xffE83D67),
                //   min: 50,
                //   max: 300,
                //   value: height,
                //   onChanged: (value) {
                //     height = value;
                //     log(value.toStringAsFixed(2));
                //     setState(() {});
                //   },
                // ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumericalContainers(
                txt: 'Weight',
                value: weight,
                onTapPlus: () {
                  setState(() {
                    weight++;
                  });
                },
                onTapminus: () {
                  setState(() {
                    weight--;
                  });
                },
              ),
              NumericalContainers(
                txt: 'Age',
                value: age,
                onTapPlus: () {
                  setState(() {
                    age++;
                  });
                },
                onTapminus: () {
                  setState(() {
                    age--;
                  });
                },
              ),
            ],
          ),
          NavigationButton(
            txt: 'Calculate',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    result: bmiResult(
                      weight: weight.toDouble(),
                      height: height,
                      age: age,
                      gender: selectedGender,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  double calculateBMI({
    required double weight, // بالكيلو
    required double height, // بالمتر
  }) {
    log((weight / (height * height)).toString());
    return weight / (height * height) * 100;
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal weight";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  // Main function تجمع كل حاجة
  Map<String, dynamic> bmiResult({
    required double weight,
    required double height,
    required int age,
    required String gender, // "male" or "female"
  }) {
    double bmi = calculateBMI(weight: weight, height: height);
    String category = getBMICategory(bmi);

    return {"bmi": bmi.toStringAsFixed(2), "category": category};
  }
}
