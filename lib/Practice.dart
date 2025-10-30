import 'package:flutter/material.dart';
import 'package:flutter_basics/Drawer.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(
      create: (_) => Model(),
    child: MyApp(),
  ),);
}
class Model extends ChangeNotifier{

  int counter = 0;
  void increment(){
    counter++;
    notifyListeners();
  }
}
class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    final counter = context.watch<Model>();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: ${counter.counter}'),
              ElevatedButton(onPressed: (){
                context.read<Model>().increment();
              }, child: Text('+'))
            ],
          ),
        ),
      ),
    );
  }
}
