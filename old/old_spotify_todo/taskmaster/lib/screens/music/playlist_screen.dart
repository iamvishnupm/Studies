import 'package:flutter/material.dart';
import 'package:taskmaster/services/music_api.dart';
import 'package:taskmaster/widgets/music/track_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaylistScreen extends StatefulWidget {
  final String playlistId;
  final String playlistName;

  const PlaylistScreen({
    super.key,
    required this.playlistId,
    required this.playlistName,
  });

  @override
  State<PlaylistScreen> createState() => _PlaylistTracksScreenState();
}

class _PlaylistTracksScreenState extends State<PlaylistScreen> {
  final api = MusicApi();
  List<dynamic>? tracks;
  bool loading = true;
  bool error = false;

  @override
  void initState() {
    super.initState();
    loadTracks();
  }

  Future<void> loadTracks() async {
    try {
      final data = await api.getPlaylistTracks(widget.playlistId);
      setState(() {
        tracks = data;
        loading = false;
      });
    } catch (_) {
      setState(() {
        error = true;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.playlistName,
          style: const TextStyle(color: Colors.white),
        ),
        actionsPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        actions: [
          // SET PLAYLIST (TEXT BUTTON)
          TextButton(
            onPressed: () {
              // confirmation popup later
            },
            child: const Text(
              "Set Playlist",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // PLAY BUTTON
          IconButton(
            onPressed: () async {
              final url =
                  "https://open.spotify.com/playlist/${widget.playlistId}";

              final uri = Uri.parse(url);

              try {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } catch (e) {
                debugPrint("Could not launch Spotify link: $e");
              }
            },
            icon: const Icon(Icons.play_arrow, color: Colors.white),
          ),
        ],
      ),

      // --------------------------
      // BODY
      // --------------------------
      body: loading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : error
          ? const Center(
              child: Text(
                "Failed to load tracks.",
                style: TextStyle(color: Colors.red),
              ),
            )
          : (tracks == null || tracks!.isEmpty)
          ? const Center(
              child: Text(
                "No tracks in this playlist",
                style: TextStyle(color: Colors.white54),
              ),
            )
          : ListView.builder(
              itemCount: tracks!.length,
              itemBuilder: (_, i) {
                final trackWrapper = tracks![i];

                // Spotify playlists sometimes wrap track inside "track"
                final track = trackWrapper["track"] ?? trackWrapper;

                return TrackListItem(track: track, onSetPressed: () {});
              },
            ),
    );
  }
}
