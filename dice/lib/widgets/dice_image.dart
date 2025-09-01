import "dart:math";
import "package:flutter/material.dart";

final random = Random();

class DiceImage extends StatefulWidget {
  const DiceImage({super.key});

  @override
  State<DiceImage> createState() => _DiceImageState();
}

class _DiceImageState extends State<DiceImage> {
  var diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: rollDice,
      child: Image.asset("assets/images/dice-$diceNumber.png", width: 200),
    );
  }
}
