import 'package:flutter/material.dart';
import 'package:flutter_basics/Drawer.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('drawer')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            DrawerHeader(child: Text('Drawer')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title:Text('Setting') ,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting(),));
  },
            )


          ],
        ),

      ),
    );

  }
}
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome to dashboard'),
      ),
    );
  }
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('you are at profile screen'),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Text('you are at the setting screen'),
      ),
    );
  }
}



