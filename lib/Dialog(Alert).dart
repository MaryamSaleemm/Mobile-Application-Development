import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          showDialog(context: context,
          barrierDismissible: false,
              builder: (context){
            return AlertDialog(
              title: Text('Exit app?'),
              content: Text('Do you really want to close the app'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('No')),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Yes'))
              ],
            );
              });
        }, child: Text('Show dialog'))
        ,
      ),
    );
  }
}
