import "package:flutter/material.dart";

class MusicSearchBar extends StatelessWidget {
  final void Function() onTap;

  const MusicSearchBar({
    //
    super.key,
    required this.onTap,
  });

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.white54, size: 20),
            SizedBox(width: 10),
            Text(
              "Search music",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
