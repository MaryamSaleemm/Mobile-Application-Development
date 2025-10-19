/*// ListView → static, builds all items at once
// ListView.builder → dynamic, builds items only when needed (better for big lists)
*/

import 'package:flutter/material.dart';
import 'package:flutter_basics/BasicStructure.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is list view'),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          reverse: true,  //make the list view reverse
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('One' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Two' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Three' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Four' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Five' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Six' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('seven' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('eight' , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}
