import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: Dice(),
    );
  }
}

class Dice extends StatefulWidget {

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;
  
  AudioCache audioCache = AudioCache();

  void rollDice() {
    audioCache.play('assets/diceSound.mp3');
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          
          Positioned(
              top:70,
              left:50,
              right:50,
              child: Image.asset('assets/diceeLogo.png',
              width: 150,
              height: 150,
              )
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/dice$leftDice.png',
                      width: 150,
                      height: 150,
                    ),
                    Image.asset(
                      'assets/dice$rightDice.png',
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: rollDice,
                  child: const Text(
                    'Roll',
                    style: TextStyle(
                      fontFamily: 'lobster',
                      fontSize: 30,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B0000),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
