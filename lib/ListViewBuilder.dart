
/*
ListView.builder
You used ListView.builder to automatically create and display each
name from your list in a scrollable, efficient, horizontal list.

ItemBuilder->Tells Flutter how to build each list item.
Here it builds a Text widget showing each name from arrNames.

index → Gives the position of the current item (0, 1, 2, ...).

itemCount → Tells how many items the list has — here it’s the length of arrNames.

itemExtent → Sets a fixed height or width for each item (here 100).

scrollDirection: Axis.horizontal → Makes the list scroll sideways instead of up and down.

*/
import 'package:flutter/material.dart';
import 'package:flutter_basics/BasicStructure.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp() ,));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    var arrNames = ['maryam' , 'aima' , 'haiqa','maryam' , 'aima' , 'haiqa','maryam' , 'aima' , 'haiqa','1' , '2' , '3' ];
      return Scaffold(
        appBar: AppBar(
          title: Text('A listView Builder'),
        ),
        body: ListView.builder(itemBuilder: (context,index){
          return Text(arrNames[index] , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500) ,);
        },
          itemCount: arrNames.length,
          // reverse: true,
          itemExtent: 100,
        scrollDirection: Axis.horizontal,
        ),

      );
  }
}
