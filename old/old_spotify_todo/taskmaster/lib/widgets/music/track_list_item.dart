import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackListItem extends StatelessWidget {
  final Map<String, dynamic> track;
  final VoidCallback onSetPressed;

  const TrackListItem({
    super.key,
    required this.track,
    required this.onSetPressed,
  });

  @override
  Widget build(BuildContext context) {
    final title = track["name"] ?? "";
    final artist = track["artists"]?[0]?["name"] ?? "";
    final image = track["album"]?["images"]?[0]?["url"];
    final spotifyUri = track["external_urls"]?["spotify"]; // link to open

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withAlpha(20), width: 1),
        ),
      ),
      child: Row(
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: image != null
                ? Image.network(image, width: 55, height: 55, fit: BoxFit.cover)
                : Container(width: 55, height: 55, color: Colors.grey[900]),
          ),
          const SizedBox(width: 14),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withAlpha(153), // ~0.6 opacity
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // PLAY BUTTON
          if (spotifyUri != null)
            IconButton(
              onPressed: () async {
                await launchUrl(
                  Uri.parse(spotifyUri),
                  mode: LaunchMode.externalApplication,
                );
              },
              icon: const Icon(Icons.play_arrow, color: Colors.white),
            ),

          // SET BUTTON
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF1DB954), // Spotify green
            ),
          ),
        ],
      ),
    );
  }
}
