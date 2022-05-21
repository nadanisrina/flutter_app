import 'dart:math';
import 'package:my_app/constants/constant.dart' as constants;

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.weight, required this.height});
  BmiCalculator.fromBmiValue(bmi) {
    this.bmi = bmi;
  }
  //function
  double calculateBMI() {
    double heightInMeter = height! / 100;
    num heightSquare = pow(heightInMeter, 2);
    // print(heightSquare);
    double result = weight! / heightSquare;
    return result;
  }

  String getCategory() {
    String bmiCategory = "";
    if (bmi! < 16.0) {
      bmiCategory = constants.underSevere;
    } else if (bmi! < 17.0) {
      bmiCategory = constants.underModerate;
    } else if (bmi! < 18.5) {
      bmiCategory = constants.underMild;
    } else if (bmi! < 25) {
      bmiCategory = constants.normal;
    } else if (bmi! < 30) {
      bmiCategory = constants.over;
    } else if (bmi! < 35) {
      bmiCategory = constants.obesityI;
    } else if (bmi! < 40) {
      bmiCategory = constants.obesityII;
    } else if (bmi! >= 40) {
      bmiCategory = constants.obesityIII;
    }
    return bmiCategory;
  }

  String getHealthRiskDescription() {
    String desc = "";
    switch (bmiCategory) {
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
}
