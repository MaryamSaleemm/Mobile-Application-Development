import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter your name',
            ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
          )


        ],
      ),
      ),
    );
  }
}
