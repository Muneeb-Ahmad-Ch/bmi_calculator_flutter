import 'dart:math';

import 'package:bmi_calculator/constant/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 26,
            letterSpacing: 2,
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height(ft)",
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight(kg)",
                      hintStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // GestureDetector(
            //   onTap: () {
            //     try {
            //       // converting height(ft) to meters
            //       double _h = double.parse(_heightController.text) * 0.3048;
            //       double _w = double.parse(_weightController.text);
            //       setState(() {
            //         _bmiResult = _w / pow(_h, 2);
            //         if (_bmiResult > 25) {
            //           _textResult = "Over Weight";
            //         } else if (_bmiResult >= 18 && _bmiResult <= 25) {
            //           _textResult = "Normal Weight";
            //         } else {
            //           _textResult = "Under Weight";
            //         }
            //       });
            //     } catch (e) {
            //       setState(() {
            //         _bmiResult = 0;
            //         _textResult = '';
            //       });
            //     }
            //   },
            //   child: const Text(
            //     "Calculate",
            //     style: TextStyle(
            //       fontSize: 28,
            //       fontWeight: FontWeight.bold,
            //       color: accentColor,
            //     ),
            //   ),
            // ),
            //
            AnimatedButton(
              width: 200,
              text: 'Calculate',
              borderColor: accentColor,
              backgroundColor: mainColor,
              selectedTextColor: mainColor,
              selectedBackgroundColor: accentColor,
              isReverse: true,
              borderRadius: 50,
              borderWidth: 2,
              transitionType: TransitionType.RIGHT_TO_LEFT,
              textStyle: const TextStyle(
                fontSize: 28,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
              onPress: () {
                try {
                  // converting height(ft) to meters
                  double _h = double.parse(_heightController.text) * 0.3048;
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / pow(_h, 2);
                    if (_bmiResult > 25) {
                      _textResult = "Over Weight";
                    } else if (_bmiResult >= 18 && _bmiResult <= 25) {
                      _textResult = "Normal Weight";
                    } else {
                      _textResult = "Under Weight";
                    }
                  });
                } catch (e) {
                  setState(() {
                    _bmiResult = 0;
                    _textResult = '';
                  });
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 90,
                color: accentColor,
              ),
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  color: accentColor,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const LeftBar(barWidth: 34),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 64),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 34),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 64),
            const SizedBox(
              height: 20,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const RightBar(barWidth: 44),
          ],
        ),
      ),
    );
  }
}
