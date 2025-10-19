
/*
A separator is a small widget (like a line or space)
that appears between list items
to make them look neat and separate.
*/
import 'package:flutter/material.dart';

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
          return ListTile(
            leading: Text('${index+1}'),
            title: Text(arrNames[index]),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.add),
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
