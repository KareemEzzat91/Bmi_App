import 'package:emiapp/EmiScreen/Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  static const String routename="resultscreen";
  final String msg;

  const ResultsScreen({super.key, required this.msg});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Bmu.routname);
    });
    // Map the message to the corresponding image asset
    final Map<String, String> imageAssets = {
      "Underweight": "Images/invis.jpeg",
      "Normal": "Images/Mr Incredible.jpeg",
      "Overweight": "Images/download.jpeg",
      "Obese": "Images/Mr increíble perturbado 7_10.jpeg",
    };

    // Get the image asset based on the message
    String imagePath = imageAssets[widget.msg] ?? 'Images/Mr increíble perturbado 7_10.jpeg';

    return Scaffold(
      backgroundColor: Color(0xff1A235AFF),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
