import 'package:flutter/material.dart';
import 'package:todo/utils/spotify_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = SpotifyAuth();
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1DB954), // Spotify  green
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        ),
        onPressed: () async {
          try {
            await auth.signIn();
          } catch (e) {
            print("Auth failed: $e");
          }
        },
        child: const Text("Sign in with Spotify"),
      ),
    );
  }
}
