import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),);
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.purple,
            ),
          ),
          ElevatedButton (
              child: Text('Elevated Button'),
              onPressed:(){
                print('elevated button pressed');
    }, ),
          ElevatedButton (
            child: Text('Elevated Button'),
            onPressed:(){
              print('elevated button pressed');
            }, )
        ],
      )


    );
  }
}

