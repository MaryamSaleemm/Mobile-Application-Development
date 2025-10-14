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
      body: Row(
        children: [
          ElevatedButton(
              child: Text('Elevated button'),
          onPressed: (){
            print('button pressed');

          },
          ),
          TextButton(
            onPressed: (){
              Text('text button pressed');
            },
            onLongPress: () {
              Text('text button pressed');
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              foregroundColor: Colors.white, // Text color
              padding: EdgeInsets.all(16), // Padding inside the button
              textStyle: TextStyle(fontSize: 18), // Font size
            ),
            child: Text('Text Button'),
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red, size: 30),
            onPressed: () {
              print("IconButton Pressed!");

            },
          ),
          FloatingActionButton(
            onPressed: () {
              print("FloatingActionButton Pressed!");
            },
            backgroundColor: Colors.blue,
            child: Icon(Icons.add, color: Colors.white),
          ),
          DropdownButton<String>(
            value: "Item 1",
            items: [
              DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
              DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
            ],
            onChanged: (String? newValue) {
              print("Selected: $newValue");
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              print("Selected: $value");
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: "Option 1", child: Text("Option 1")),
              PopupMenuItem(value: "Option 2", child: Text("Option 2")),
            ],
          ),

          GestureDetector(
            onTap: () {
              print("Custom Button Pressed!");
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Custom Button", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          )
         ]
      )
    );
  }
}
