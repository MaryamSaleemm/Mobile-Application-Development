import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text('app bar'),
          bottom: TabBar(tabs:
          [
            Tab(text:'Home',icon: Icon(Icons.home),),
            Tab(text:'Login',icon: Icon(Icons.login),),
            Tab(text:'Subscribe',icon: Icon(Icons.subscriptions),)
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: Text('this is a home page'),

          ),
          Center(
            child: Text('this is a login page'),

          ),
          Center(
            child: Text('this is a Subscribe page'),

          )
        ]),
      )),
    );
  }
}

