import "package:flutter/material.dart";
import "package:taskmaster/screens/music/music_search_screen.dart";
import "package:taskmaster/screens/music/music_top_list_screen.dart";
import "package:taskmaster/screens/music/playlist_screen.dart";
import "package:taskmaster/widgets/music/playlist_section.dart";
import "package:taskmaster/widgets/music/top_music_section.dart";
import "package:taskmaster/services/music_controller.dart";
import "package:taskmaster/utils/functions.dart";
import "package:taskmaster/widgets/music/music_search_bar.dart";
import "package:taskmaster/widgets/music/playlist_header.dart";

class MusicScrollView extends StatelessWidget {
  final MusicController controller;

  const MusicScrollView({
    //
    super.key,
    required this.controller,
  });

  @override
  Widget build(context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        //

        // SearchBar
        SliverAppBar(
          pinned: false,
          floating: true,
          backgroundColor: Colors.black,
          elevation: 0,
          title: MusicSearchBar(
            onTap: () {
              loadScreen1(context, MusicSearchScreen());
            },
          ),
        ),

        // TopMusicSection
        SliverToBoxAdapter(
          child: TopMusicSection(
            tracks: controller.topTracks,
            loading: controller.loadingTop,
            onSeeAll: () {
              loadScreen1(
                context,
                MusicTopListScreen(tracks: controller.topTracks ?? []),
              );
            },
          ),
        ),

        // PlaylistHeader
        SliverPersistentHeader(pinned: true, delegate: PlaylistHeader()),
      ],

      //
      body: PlaylistSection(
        playlists: controller.playlists,
        loading: controller.loadingPlaylists,
        onOpenPlaylist: (playlistId) {
          final name = controller.playlists!.firstWhere(
            (p) => p["id"] == playlistId,
          )["name"];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  PlaylistScreen(playlistId: playlistId, playlistName: name),
            ),
          );
        },
      ),
    );
  }
}
