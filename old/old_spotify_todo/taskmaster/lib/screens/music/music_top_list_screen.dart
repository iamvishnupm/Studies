import 'package:flutter/material.dart';
import 'package:taskmaster/widgets/music/track_list_item.dart';

class MusicTopListScreen extends StatelessWidget {
  final List<dynamic>? tracks;

  const MusicTopListScreen({super.key, required this.tracks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Top Music", style: TextStyle(color: Colors.white)),
      ),
      body: (tracks == null || tracks!.isEmpty)
          ? const Center(
              child: Text(
                "No tracks available",
                style: TextStyle(color: Colors.white54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              itemCount: tracks!.length,
              itemBuilder: (_, i) =>
                  TrackListItem(track: tracks![i], onSetPressed: () {}),
            ),
    );
  }
}
