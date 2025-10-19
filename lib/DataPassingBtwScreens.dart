import 'package:flutter/material.dart';
import 'package:flutter_basics/BasicStructure.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: Screen1(),));
}
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('This is Data Passing Between Screens'),
  backgroundColor: Colors.blue,
),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',style: TextStyle(fontSize: 40,fontWeight:FontWeight.w500),),
              TextField(
                controller: nameController,
                  decoration:
                InputDecoration(
                  hintText: 'Enter your name here'
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(nameController.text.toString()),));
              }, child: Text('My Profile'))
            ],
          ),
        ),
      ),
    );
  }
}
class Screen2 extends StatelessWidget {

  var nameFromScreen1;
  Screen2(this.nameFromScreen1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome:$nameFromScreen1', style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Back'))
            ],
          ),
        ),
      );;
  }
}
