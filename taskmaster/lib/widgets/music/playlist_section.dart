import 'package:flutter/material.dart';

class PlaylistSection extends StatelessWidget {
  final List<dynamic>? playlists;
  final bool loading;
  final Function(String playlistId) onOpenPlaylist;

  const PlaylistSection({
    super.key,
    required this.playlists,
    required this.loading,
    required this.onOpenPlaylist,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (playlists == null || playlists!.isEmpty) {
      return const Center(
        child: Text("No playlists", style: TextStyle(color: Colors.white54)),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: playlists!.length,
      itemBuilder: (_, i) {
        final p = playlists![i];
        final id = p["id"];
        final name = p["name"] ?? "";
        final image = p["images"]?.isNotEmpty == true
            ? p["images"][0]["url"]
            : null;

        return GestureDetector(
          onTap: () => onOpenPlaylist(id),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                // IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: image != null
                      ? Image.network(
                          image,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 55,
                          height: 55,
                          color: Colors.grey[900],
                        ),
                ),
                const SizedBox(width: 14),

                // NAME
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const Icon(Icons.chevron_right, color: Colors.white70),
              ],
            ),
          ),
        );
      },
    );
  }
}
