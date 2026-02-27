import 'package:flutter/material.dart';
import 'package:taskmaster/widgets/music/track_list_item.dart';

class TopMusicSection extends StatelessWidget {
  final List<dynamic>? tracks;
  final bool loading;
  final VoidCallback onSeeAll;

  const TopMusicSection({
    super.key,
    required this.tracks,
    required this.loading,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------------------------------------------------------
        // HEADER
        // ---------------------------------------------------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Music",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: onSeeAll,
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white70,
                  size: 26,
                ),
              ),
            ],
          ),
        ),

        // ---------------------------------------------------------
        // CONTENT
        // ---------------------------------------------------------
        if (loading)
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(color: Colors.white),
            ),
          )
        else if (tracks == null || tracks!.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text("No tracks", style: TextStyle(color: Colors.white54)),
            ),
          )
        else
          Column(
            children: List.generate(
              //
              tracks!.length >= 3 ? 3 : tracks!.length,
              (i) => TrackListItem(track: tracks![i], onSetPressed: () {}),
            ),
          ),
      ],
    );
  }
}
