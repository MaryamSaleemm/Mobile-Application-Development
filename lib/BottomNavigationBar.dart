import 'package:flutter/material.dart';

void main() {
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
 int Index = 0;

 final List<Widget> pages = [
   Center(child: Text('this a home page',style: TextStyle(fontSize: 20),),),
   Center(child: Text('this a login page',style: TextStyle(fontSize: 20),),),
   Center(child: Text('this a subscribe page',style: TextStyle(fontSize: 20),),)
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is a bottom navigation bar'),
      ),
      body: pages[Index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Index,
          onTap: (index){
            setState(() {
              Index = index;
            });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.login),label: ',Login',),
            BottomNavigationBarItem(icon: Icon(Icons.subscriptions),label: 'Subscribe',)


      ]),
    );
  }
}
