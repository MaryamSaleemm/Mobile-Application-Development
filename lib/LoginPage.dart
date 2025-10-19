import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1()));
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final String email = "admin";
  final String password = "admin";

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          children: [
            Container(
              child: Text("Login" , style: TextStyle(fontSize: 25,height: 15,fontWeight: FontWeight.bold),),),
            Container(
              width: 200,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "Username"
                ),),),Container(
              width: 200,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  //icon: Icon(Icons.password),
                ),),),
            ElevatedButton(onPressed: (){
              if(usernameController.text == email && passwordController.text == password){
                print("Successful");
                Navigator.push(context, MaterialPageRoute(builder: (context) => screen2()));
              }
              else{
                print("Wrong password");
              }

            }, child: Text("Submit!"))

          ],
        ),
      ),
    );
  }
}
class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Text("Login Succeessful", style: TextStyle(height: 15,fontSize: 10,fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed:(){
                Navigator.pop(context);
              }, child: Text("Logout")),
            ]
        )
    );
  }
}