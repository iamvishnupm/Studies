import "package:flutter/material.dart";
import "package:start/utils/styled_text.dart";
import "package:start/utils/gradient_container.dart";

void main() {
  runApp(
    MaterialApp(
      home: const HomeWidget(),
      //
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        colors: [
          const Color.fromARGB(255, 44, 10, 102),
          const Color.fromARGB(255, 155, 103, 246),
          //
        ],
        child: Center(child: StyledText("The Beginning.")),
      ),
    );
  }
}
