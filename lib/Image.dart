import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 600,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/MPF Logo.png')),
        ),
      ),
    );
  }
}
