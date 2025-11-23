import "package:flutter/material.dart";

void loadScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      //
      builder: (_) => screen,
    ),
  );
}
