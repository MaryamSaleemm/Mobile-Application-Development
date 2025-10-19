
/*
A separator is a small widget (like a line or space)
that appears between list items
to make them look neat and separate.
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

    var arrNames = ['maryam' , 'aima' , 'haiqa','maryam' , 'aima' , 'haiqa','1' , '2' , '3' ];
    return Scaffold(
      appBar: AppBar(
        title: Text('A listView Builder'),
      ),
      body: ListView.separated(itemBuilder: (context,index){
        return Row(
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(arrNames[index] , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500) ,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(arrNames[index] , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500) ,),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(arrNames[index] , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500) ,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(arrNames[index] , style: TextStyle(fontSize: 20 , fontWeight:FontWeight.w500) ,),
        )
          ],
        );
      },
        itemCount: arrNames.length,
        // reverse: true,
        // scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index){
        return Divider(height: 50 , thickness: 2,);
        },
      )

    );
  }
}
