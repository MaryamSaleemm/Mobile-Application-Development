import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am trying to learn containers', style: TextStyle(fontSize: 18 , color: Colors.black),),
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.purple,
          child: Text('hello developer'),
        ),
      ),
    );
  }
}
