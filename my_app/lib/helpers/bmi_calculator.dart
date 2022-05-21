import 'dart:math';
import 'package:my_app/constants/constant.dart' as constants;

class BmiCalculator {
  int? height;
  int? weight;
  double bmi = 0;
  String bmiCategory = '';
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
    bmi = result;
    return bmi;
  }

  String? getCategory() {
    if (bmi < 16.0) {
      bmiCategory = constants.underSevere;
    } else if (bmi < 17.0) {
      bmiCategory = constants.underModerate;
    } else if (bmi < 18.5) {
      bmiCategory = constants.underMild;
    } else if (bmi < 25) {
      bmiCategory = constants.normal;
    } else if (bmi < 30) {
      bmiCategory = constants.over;
    } else if (bmi < 35) {
      bmiCategory = constants.obesityI;
    } else if (bmi < 40) {
      bmiCategory = constants.obesityII;
    } else if (bmi >= 40) {
      bmiCategory = constants.obesityIII;
    }
    return bmiCategory;
  }

  String? getHealthRiskDescription() {
    switch (bmiCategory) {
      case constants.underSevere:
        bmiDescription = "Possible nutritional deficiency and osteoporosis.";
        break;
      case constants.underModerate:
        bmiDescription = "Possible nutritional deficiency and osteoporosis.";
        break;
      case constants.underMild:
        bmiDescription = "Possible nutritional deficiency and osteoporosis.";
        break;
      case constants.normal:
        bmiDescription = "Low Risk (healthy range).";
        break;
      case constants.over:
        bmiDescription =
            "Moderate risk of developing heart disease, high blood pressure";
        break;
      case constants.obesityI:
        bmiDescription =
            "Moderate risk of developing heart disease, high blood pressure";
        break;
      case constants.obesityII:
        bmiDescription =
            "Moderate risk of developing heart disease, high blood pressure";
        break;
      case constants.obesityIII:
        bmiDescription =
            "Moderate risk of developing heart disease, high blood pressure";
        break;
      default:
    }
    return bmiDescription;
  }
}
