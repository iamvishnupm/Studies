import 'package:flutter/foundation.dart';
import 'package:taskmaster/services/music_api.dart';

class MusicController extends ChangeNotifier {
  final MusicApi api;

  MusicController(this.api);

  // ---------------------------------------------------------------------------
  // DATA
  // ---------------------------------------------------------------------------
  List<dynamic>? topTracks;
  List<dynamic>? playlists;
  Map<String, List<dynamic>> playlistTracks = {};

  bool loadingTop = false;
  bool loadingPlaylists = false;
  bool loadingPlaylistTracks = false;

  // ---------------------------------------------------------------------------
  // LOAD TOP TRACKS (fallback → recent)
  // ---------------------------------------------------------------------------
  Future<void> loadTopTracks() async {
    if (loadingTop) return;
    loadingTop = true;
    notifyListeners();

    try {
      final items = await api.getTopTracks();
      topTracks = items.isNotEmpty ? items : await api.getRecentlyPlayed();
    } finally {
      loadingTop = false;
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // LOAD PLAYLISTS
  // ---------------------------------------------------------------------------
  Future<void> loadPlaylists() async {
    if (loadingPlaylists) return;
    loadingPlaylists = true;
    notifyListeners();

    try {
      playlists = await api.getPlaylists();
    } finally {
      loadingPlaylists = false;
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // LOAD TRACKS INSIDE ONE PLAYLIST
  // ---------------------------------------------------------------------------
  Future<void> loadPlaylistTracks(String playlistId) async {
    if (loadingPlaylistTracks) return;
    loadingPlaylistTracks = true;
    notifyListeners();

    try {
      playlistTracks[playlistId] = await api.getPlaylistTracks(playlistId);
    } finally {
      loadingPlaylistTracks = false;
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // SEARCH
  // ---------------------------------------------------------------------------
  Future<List<dynamic>> search(String query) {
    return api.searchTracks(query);
  }
}
