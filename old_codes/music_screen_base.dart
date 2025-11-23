import "package:flutter/material.dart";
import "../../services/music_api.dart";

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  List<dynamic>? playlists;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final api = MusicApi();
      final data = await api.getPlaylists();
      setState(() {
        playlists = data;
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1720),
        leading: const BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : error != null
          ? Center(
              child: Text(
                "Error: $error",
                style: const TextStyle(color: Colors.redAccent),
              ),
            )
          : ListView.builder(
              itemCount: playlists!.length,
              itemBuilder: (_, i) {
                final p = playlists![i];
                return ListTile(
                  title: Text(
                    p["name"] ?? "No name",
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "${p["tracks"]?["total"] ?? 0} songs",
                    style: const TextStyle(color: Colors.white54),
                  ),
                );
              },
            ),
    );
  }
}
