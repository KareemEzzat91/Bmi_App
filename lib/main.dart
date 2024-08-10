import 'EmiScreen/Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp ());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("emi App"),
      initialRoute: Bmu.routname  ,
      routes: {
        Bmu.routname:  (context) => Bmu (),

      },

    );
  }
}
//0xff1A235AFF
//0xffF44336FF
