
/*
The Card widget is used to
display related information together inside a box with
a shadow, rounded corners, and elevation (3D look).
*/
import 'package:flutter/material.dart';
import 'package:flutter_basics/BasicStructure.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp() ,));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    var arrNames = ['maryam' , 'aima' , 'haiqa','maryam' , 'aima' , 'haiqa','maryam' , 'aima' , 'haiqa','1' , '2' , '3' ];
    return Scaffold(
      appBar: AppBar(
        title: Text('A Card'),
      ),
      body: Center(
        child: Card(
          elevation: 2,   //Shadow size
          shadowColor: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Hello Maryam', style: TextStyle(fontWeight:FontWeight.w500,color: Colors.black),),
          ),
        ),
      )

    );
  }
}
