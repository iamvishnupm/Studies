import "package:flutter/material.dart";
import "package:dice/widgets/dice_image.dart";
import "package:dice/utils/gradient_container.dart";

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
      //
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientContainer(
        colors: [
          Color.fromARGB(255, 42, 10, 98),
          Color.fromARGB(255, 93, 62, 145),
          //
        ],
        child: Center(child: DiceImage()),
      ),
    );
  }
}
