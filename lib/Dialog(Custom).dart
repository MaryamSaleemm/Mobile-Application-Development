import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DialogExample(),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Dialog "),
        centerTitle: true,
      ),
      body:Center(
        child: ElevatedButton(onPressed: (){
          showDialog(context: context,
              builder: ((context){
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info,color: Colors.blue,size: 30,),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Exit App',style: TextStyle(fontWeight: FontWeight.w500),),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Close'))
                      ],
                    ),
                  ),

                );
              }));
        }, child: Text('Custom Dialog')),
      ),
    );
  }
}
