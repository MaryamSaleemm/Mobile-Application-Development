import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const LudoGameApp());
}

class LudoGameApp extends StatelessWidget {
  const LudoGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Game',
      debugShowCheckedModeBanner: false,
      home: LudoGameScreen(),
    );
  }
}

class LudoGameScreen extends StatefulWidget {
  @override
  _LudoGameScreenState createState() => _LudoGameScreenState();
}

class _LudoGameScreenState extends State<LudoGameScreen> {
  int player1Score = 0;
  int player2Score = 0;

  int box1 = 0;
  int box2 = 0;
  String leader = "";

  void rollDice(int player) {
    setState(() {
      box1 = Random().nextInt(6) + 1; // 1–6
      box2 = Random().nextInt(6) + 1;

      int sum = box1 + box2;

      if (player == 1) {
        player1Score += sum;
      } else {
        player2Score += sum;
      }

      if (player1Score > player2Score) {
        leader = "Player 1 is leading";
      } else if (player2Score > player1Score) {
        leader = "Player 2 is leading";
      } else {
        leader = "It's a tie";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Two Player Game"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            playerSection("Player 1", player1Score, () => rollDice(1)),
            const SizedBox(height: 20),

            // Boxes showing random numbers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                diceBox(box1),
                const SizedBox(width: 20),
                diceBox(box2),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              "Sum: ${box1 + box2}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            playerSection("Player 2", player2Score, () => rollDice(2)),

            const SizedBox(height: 40),

            Text(
              leader,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for player info
  Widget playerSection(String name, int score, VoidCallback onPressed) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Score: $score",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              child: Text("Roll $name"),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for dice boxes
  Widget diceBox(int value) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2))
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        value == 0 ? "-" : value.toString(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}