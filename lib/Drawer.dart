import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text('An App Bar'),),
          drawer: Drawer(
            backgroundColor: Colors.blue,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(child: Text('A drawer header',style: TextStyle(fontSize:40,fontWeight: FontWeight.w500,))),
                ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text('Dashboard'),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )
        ),
    );
  }
}
