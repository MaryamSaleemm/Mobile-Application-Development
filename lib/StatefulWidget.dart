import 'package:flutter/material.dart';
import 'package:flutter_basics/BasicStructure.dart';

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

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('my app bar'),
),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter:$count'),
              Container(
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    count++;
                  });
                }, child: Text('Counter')),
              ),

            ],
          )
      ),
    );
  }
}
