import 'package:flutter/material.dart';
import 'package:my_app/constants/constant.dart' as constants;
import 'package:my_app/helpers/bmi_calculator.dart';
import 'package:my_app/views/bmi_data_screen.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmiResult}) : super(key: key);
  final double bmiResult;

  @override
  Widget build(BuildContext context) {
    final bmiCalculator = BmiCalculator.fromBmiValue(bmiResult);
    bmiCalculator.getCategory();
    bmiCalculator.getHealthRiskDescription();
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Hasil hitung BMI"))),
      body: Column(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Center(
              child: Text(
                "Hasil Hitung",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
          )),
          Expanded(
              flex: 5,
              child: Container(
                  child: BmiCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          bmiCalculator
                              .bmiCategory, // karena di deklarasi boleh null, maka harus kasih !
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800])),
                      Text(bmiResult.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: constants.primaryColor)),
                      Text(bmiCalculator.bmiDescription!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: constants.primaryColor)),
                    ],
                  ),
                ),
              ))),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: constants.ternaryColor,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              height: 50,
              child: const Center(
                  child: (Text(
                "HITUNG ULANG",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))),
            ),
          )
        ],
      ),
    );
  }
}
