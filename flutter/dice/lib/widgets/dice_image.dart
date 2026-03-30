import "dart:math";
import "package:flutter/material.dart";

final random = Random();

class DiceImage extends StatefulWidget {
  const DiceImage({super.key});

  @override
  State<DiceImage> createState() => _DiceImageState();
}

class _DiceImageState extends State<DiceImage> {
  int diceNumber = 1;

  void _rollDice() {
    setState(() {
      diceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: _rollDice,
      child: Image.asset("images/dice-$diceNumber.png", width: 200),
      //
    );
  }
}
