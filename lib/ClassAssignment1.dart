import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitManagerApp(),
    );
  }
}

class FruitManagerApp extends StatefulWidget {
  const FruitManagerApp({super.key});
  @override
  State<FruitManagerApp> createState() => _FruitManagerAppState();
}

class _FruitManagerAppState extends State<FruitManagerApp> {
  final TextEditingController fruitController =
  TextEditingController(); // Controller here
  List<String> fruit = [];

  void addFruit() {
    String name = fruitController.text;
    if (name.isNotEmpty) {
      setState(() {
        // to reflect new changes to flutter
        fruit.add(name);
      });
      fruitController.clear();
    }
  }

  void deleteFruit(int i) {
    setState(() {
      fruit.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fruit Manager App' )),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Fruit Count ${fruit.length}'),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: fruitController,
                    decoration: InputDecoration(
                      labelText: 'Enter fruit name you want to add',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addFruit,
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: fruit.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(fruit[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () => deleteFruit(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ************     Visual Representation      ***************
/*MaterialApp
 └── FruitPage (StatefulWidget)
     └── Scaffold
         ├── AppBar
         │    └── Text("Fruit List")
         │
         └── Body → Padding (EdgeInsets.all(16))
              └── Column
                  ├── Text("Total Fruits: ${fruits.length}")
                  ├── SizedBox(height: 10)
                  ├── Row
                  │    ├── Expanded
                  │    │    └── TextField (fruitCtrl)
                  │    ├── SizedBox(width: 10)
                  │    └── ElevatedButton("Add")
                  │
                  ├── SizedBox(height: 20)
                  └── Expanded
                       └── ListView.builder
                            └── For each fruit in fruits:
                                 └── ListTile
                                      ├── title → Text(fruits[index])
                                      └── trailing → IconButton(delete)
*/
