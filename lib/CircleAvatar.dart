/*
image that appears round in contact lists
*/
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var arrNames = [
      'maryam',
      'aima',
      'haiqa',
      'maryam',
      'aima',
      'haiqa',
      '1',
      '2',
      '3',
    ];
    return Scaffold(
      appBar: AppBar(title: Text('A listView Builder')),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              child: Text('name', style: TextStyle(color: Colors.black)),
              backgroundImage: AssetImage('assets/logo.png'),
              backgroundColor: Colors.red,
              radius: 50,
              // minRadius: 20,  // radius not less than this
              // maxRadius: 50,  //radius not more than this
              //instead of wrapping CircleAvatar in Container i use radius to adjust image size
            ),
            SizedBox(height: 30),
            CircleAvatar(
              child: Container(
                height: 60,
                width: 60,
                child: Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/MPFLogo.png'),
                    ),
                    Text('name', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              backgroundColor: Colors.blue,
              maxRadius: 80,
            ),
          ],
        ),
      ),
    );
  }
}
