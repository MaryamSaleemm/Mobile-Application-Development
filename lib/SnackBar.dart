import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SnackBarExample(),
    );
  }
}

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Message sent'),
              action: SnackBarAction(
                  label: 'Undo',
                  onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Message Undo'),
                      duration: Duration(seconds: 2),
                    ),
                );
              },),
            ),
          );
        }, child: Text('Snack Bar')),
      ),
    );
  }
}
