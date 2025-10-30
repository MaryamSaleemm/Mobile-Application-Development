import 'package:flutter/material.dart';
import 'package:flutter_basics/Drawer.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int counter= 0;

  void Counter(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text('Counter: $counter'),
            ElevatedButton(onPressed: (){
              Counter();
            }, child: Text('+'))
          ],
        ),
      ),

    );
  }
}
