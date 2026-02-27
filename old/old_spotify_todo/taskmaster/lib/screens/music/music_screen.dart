import 'package:flutter/material.dart';
import 'package:taskmaster/services/music_api.dart';
import 'package:taskmaster/services/music_controller.dart';
import 'package:taskmaster/widgets/music/music_scroll_view.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late MusicController controller;

  @override
  void initState() {
    super.initState();
    controller = MusicController(MusicApi());
    controller.loadTopTracks();
    controller.loadPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) => MusicScrollView(controller: controller),
        ),
      ),
    );
  }
}
