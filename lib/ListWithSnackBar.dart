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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with snackbar'),
      ),
      body:Padding(padding: EdgeInsets.all(20),
          child: Center(
            child: ListView(
            children: [
              ListTile(
                title: Text('burger'),
                onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('you have entered burger'),));
                    }
              ),
              ListTile(
                  title: Text('pizza'),
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('you have entered pizza'),));
                  }
              ),
              ListTile(
                  title: Text('fries'),
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('you have entered fries'),));
                  }
              )
            ],
                  ),
          ),
      ),
    );
  }
}
