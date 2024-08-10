import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Gender SelectedGender = Gender.Male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A235AFF),
      appBar: buildAppBar() ,
      body: Column(
        children: [

          Expanded(
            child:Container(
           child:  Row(
             children: [
               Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: GestureDetector(
                       onTap:(){
                         SelectedGender = Gender.Male;
                         setState(() {

                         });
                       } ,
                       child: Container(
                         decoration:  buildBoxDecoration(x:  SelectedGender == Gender.Male ),
                         child: Column (
                           children: [
                             SizedBox(height: 15,),
                             Text( "Male ",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                             Expanded(child:  Icon(Icons.male,size:160 ,color: Colors.blueAccent,),)
                           ],
                         ),

                       ),
                     ),
                   )),
               Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: GestureDetector(
                       onTap: (){
                         SelectedGender = Gender.Female;
                         setState(() {

                         });
                       },

                       child: Container(
                         child: Column (
                           children: [
                             SizedBox(height: 15,),
                             Text( "Female ",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                            Expanded(child:  Icon(Icons.female,size:160 ,color: Colors.pink,),)

                           ],
                         ),

                         decoration: buildBoxDecoration (x:SelectedGender==Gender.Female ),
                       ),
                     ),
                   )),

             ],

           ),
          )
          ),
          Expanded(child: Row(

          )
          ),
          Expanded(child: Row()),


        ],
      ),





    );

  }

  BoxDecoration buildBoxDecoration({bool x =false }) {
    return BoxDecoration(
                       color: x ? Colors.red:  Color(0xff212D71FF),
                       borderRadius: BorderRadius.circular(20),

                     );
  }















  AppBar buildAppBar() => AppBar( title: Text("BMI CALCULATOR",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),backgroundColor: Color(0xff1A235AFF),);
}
