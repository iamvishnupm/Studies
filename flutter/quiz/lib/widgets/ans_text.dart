import "package:flutter/material.dart";

class AnsText extends StatelessWidget {
  final String text;

  const AnsText({
    //
    super.key,
    required this.text,
  });

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        //
        fontSize: 16,
        // fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
