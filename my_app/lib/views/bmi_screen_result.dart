import 'package:flutter/material.dart';
import 'package:my_app/constants/constant.dart' as constants;
import 'package:my_app/views/bmi_data_screen.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmiResult}) : super(key: key);
  final double bmiResult;
  //function
  String getHealthRiskDescription(String category) {
    String desc = "";
    switch (category) {
      case constants.underSevere:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case constants.underModerate:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case constants.underMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case constants.normal:
        desc = "Low Risk (healthy range).";
        break;
      case constants.over:
        desc = "Moderate risk of developing heart disease, high blood pressure";
        break;
      case constants.obesityI:
        desc = "Moderate risk of developing heart disease, high blood pressure";
        break;
      case constants.obesityII:
        desc = "Moderate risk of developing heart disease, high blood pressure";
        break;
      case constants.obesityIII:
        desc = "Moderate risk of developing heart disease, high blood pressure";
        break;
      default:
    }
    return desc;
  }

  String getCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = constants.underSevere;
    } else if (bmiValue < 17.0) {
      category = constants.underModerate;
    } else if (bmiValue < 18.5) {
      category = constants.underMild;
    } else if (bmiValue < 25) {
      category = constants.normal;
    } else if (bmiValue < 30) {
      category = constants.over;
    } else if (bmiValue < 35) {
      category = constants.obesityI;
    } else if (bmiValue < 40) {
      category = constants.obesityII;
    } else if (bmiValue >= 40) {
      category = constants.obesityIII;
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
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
                      Text(getCategory(bmiResult),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800])),
                      Text("${bmiResult.toStringAsFixed(1)}",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: constants.primaryColor)),
                      Text(getHealthRiskDescription(getCategory(bmiResult)),
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
