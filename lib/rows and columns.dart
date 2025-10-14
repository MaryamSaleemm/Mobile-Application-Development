import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:HomePage());
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,  // Align items in center
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to left
        children: [
          ElevatedButton(
              child: Text('elevated button'),
              onPressed: (){
                print('elevated button is pressed');
              }
          ),
          TextButton(
              child: Text('text button'),
              onPressed: (){
                print('text buttton pressed');
              }
          ),
          Text('Item 1'),
          Text('Item 2'),
          Text('Item 3'),
        ],

      ),
    );
  }
}

