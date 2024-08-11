import 'package:emiapp/EmiScreen/resultscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bmu extends StatefulWidget {
  const Bmu({super.key});
  static const String routname = "Main Screen ";

  @override
  State<Bmu> createState() => _BmuState();
}
enum Gender {
  Male,Female
}
class _BmuState extends State<Bmu> {
  double valucm = 120;
  int weight = 70;
  int age = 15;
  Gender SelectedGender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A235AFF),
      appBar: buildAppBar(),
      body: Column(
        children: [

          Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: [
                    buildBox(name: "Male",
                        gender: Gender.Male,
                        ic: Icon(
                          Icons.male, size: 125, color: Colors.blueAccent,)),
                    buildBox(name: "Female",
                        gender: Gender.Female,
                        ic: Icon(Icons.female, size: 125, color: Colors.pink,)),

                  ],

                ),
              )
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: buildBoxDecoration(),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),

                      Text("HEIGHT", style: TextStyle(color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(valucm.toStringAsFixed(0), style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.bold),),
                            Text("CM", style: TextStyle(color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),)

                          ]
                      ),
                      Slider(
                        activeColor: Colors.red,
                        min: 100,
                        max: 250,
                        value: valucm,
                        onChanged: (val) {
                          valucm = val;
                          setState(() {

                          }
                          );
                        },
                      ),


                    ],
                  )
              ),
            ),
          ),
          Expanded(flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: buildBoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildbox("WEIGHT", weight: weight),
                          SizedBox(width: 20,),
                          buildbox("AGE", age: age)
                        ],


                      ),
                      buildStart()
                    ],
                  ),
                ),
              )),


        ],
      ),

    );
  }

  Padding buildStart() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("CALC          ", style: TextStyle(color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
            SizedBox(width: 15,),
            FloatingActionButton(onPressed: () {
              final bmi = weight /
                  ((valucm / 100) * (valucm / 100));
              String msg;
              if (bmi < 18.5) {
                msg = "Underweight";
              } else if (bmi >= 18.5 && bmi < 24.9) {
                msg = "Normal";
              } else if (bmi >= 25 && bmi < 29.9) {
                msg = "Overweight";
              } else {
                msg = "Obesity";
              }
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(msg: msg),
                ),
              );

               showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(msg, style: TextStyle(fontSize: 45)),
                  content: Text("Your BMI is ${bmi.toInt()}",
                    style: TextStyle(fontSize: 30),),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child:
                    Text("OK", style: TextStyle(fontSize: 40),)
                    )
                  ],

                );
              }

              );
            },
              child: Icon(Icons.not_started, size: 60, color: Colors.red,),

            ),
            Text("           BMI", style: TextStyle(color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold),),

          ]
      ),
    );
  }


  Expanded buildbox(String s, {int? weight, int? age}) {
    return Expanded(
      child: Container(
        decoration: buildBoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s,
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              (weight != null ? this.weight : this.age ?? 0).toString(),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (weight != null) {
                        this.weight++;
                      } else if (age != null) {
                        this.age++;
                      }
                    });
                  },
                  color: Colors.red,
                  child: Icon(Icons.add, size: 55, color: Colors.white),
                ),
                SizedBox(width: 15),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (weight != null) {
                        this.weight--;
                      } else if (age != null) {
                        this.age--;
                      }
                    });
                  },
                  color: Colors.blueAccent,
                  child: Icon(Icons.remove, size: 55, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildBox(
      {required String name, required Gender gender, required Icon ic}) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              SelectedGender = gender;
              setState(() {

              });
            },
            child: Container(
              decoration: buildBoxDecoration(x: SelectedGender == gender),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text(name, style: TextStyle(fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                  Expanded(child: ic,)
                ],
              ),

            ),
          ),
        ));
  }

  BoxDecoration buildBoxDecoration({bool x = false }) {
    return BoxDecoration(
      color: x ? Colors.red : Color(0xff212D71FF),
      borderRadius: BorderRadius.circular(20),

    );
  }


  AppBar buildAppBar() {
    return AppBar(
      title: Text("BMI CALCULATOR", style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),

      ),
      actions: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("What is BMI?"),
                  content: const Text(
                    "BMI stands for Body Mass Index. It is a measure of body fat based on height and weight. "
                        "The formula is BMI = weight (kg) / (height (m))^2. It is commonly used to categorize "
                        "individuals into various weight categories such as underweight, normal weight, overweight, "
                        "and obese.",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.info, color: Colors.white, size: 40),
        )
      ],
      backgroundColor: Color(0xff1A235AFF),);
  }
}
