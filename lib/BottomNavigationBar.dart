import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // Track selected tab

  // List of screens for each tab
  final List<Widget> _pages = [
    Center(child: Text('This is Home Page', style: TextStyle(fontSize: 18))),
    Center(child: Text('This is Login Page', style: TextStyle(fontSize: 18))),
    Center(child: Text('This is Subscribe Page', style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Bottom Navigation Example')),
        body: _pages[_selectedIndex], // Show selected page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, // Highlight current tab
          onTap: (index) {
            setState(() {
              _selectedIndex = index; // Change page when tapped
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: "Login",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Subscribe",
            ),
          ],
        ),
      ),
    );
  }
}
