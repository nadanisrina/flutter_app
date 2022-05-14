import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/constants/constant.dart';
import 'package:my_app/views/bmi_screen_result.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: const [
              Expanded(
                child: BmiCard(
                  child: GenderIconText(title: "Male", icon: Icons.male),
                ),
              ),
              Expanded(
                child: BmiCard(
                  child: GenderIconText(title: "Female", icon: Icons.female),
                ),
              ),
            ],
          )),
          Expanded(
              child: BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "HEIGHT",
                    //explain: override labelTextStyle
                    style: labelTextStyle!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment
                      .end, //explain: untuk membuat cm kebawah
                  children: [
                    Text(
                      '$height',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 80,
                  max: 200,
                  thumbColor: primaryColor,
                  activeColor: primaryColor,
                  inactiveColor: ternaryColor,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: Row(
              children: [
                Expanded(
                    child: BmiCard(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$weight",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Text(
                          "kg",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 40, height: 40),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 40, height: 40),
                        ),
                      ],
                    )
                  ],
                ))),
                Expanded(
                    child: BmiCard(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: labelTextStyle!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$age",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            age = age += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 40, height: 40),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            if (age > 0) {
                              age = age -= 1;
                              setState(() {});
                            }
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 40, height: 40),
                        ),
                      ],
                    )
                  ],
                )))
              ],
            ),
          )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) {
                  return BmiResultScreen();
                }),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffec3c66),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              height: 50,
              child: const Center(
                  child: (Text(
                "HITUNG BMI",
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

/*explain: return box */
class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}

/*explain: return icon dan text */
class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: primaryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(title, style: genderTextStyle)
      ],
    );
  }
}
