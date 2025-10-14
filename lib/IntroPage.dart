import 'package:flutter/material.dart';
import 'package:flutter_basics/HomePage.dart'; //  import

class IntroPage extends StatelessWidget {
   const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Intro')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            'Welcome',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 11),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomePage()),
              );
            },
            child:  Text('Next'),
          )
        ],
      ),
    );
  }
}
