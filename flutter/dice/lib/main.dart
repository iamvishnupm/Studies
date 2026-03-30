import "package:dice/widgets/dice_image.dart";
import "package:dice/widgets/gradient_container.dart";
import "package:flutter/material.dart";

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          colors: [
            const Color.fromARGB(255, 32, 3, 82),
            const Color.fromARGB(255, 103, 60, 177),
            //
          ],
          child: Center(child: DiceImage()),
        ),
      ),
    );
  }
}
