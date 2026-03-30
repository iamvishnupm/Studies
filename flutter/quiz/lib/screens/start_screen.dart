import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  final void Function() onPress;

  const StartScreen({
    //
    super.key,
    required this.onPress,
  });

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("images/logo.png", width: 300),
        SizedBox(height: 80),
        ElevatedButton.icon(
          onPressed: () {},
          label: Text("Start"),
          icon: Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}
