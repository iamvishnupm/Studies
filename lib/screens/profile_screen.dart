import 'package:flutter/material.dart';
import 'package:todo/services/spotify_auth.dart';
import 'package:todo/state/session_manager.dart';
import 'package:todo/widgets/center_feature.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = SpotifyAuth();

  // @override
  // void initState() {
  //   super.initState();
  //   _loadExistingSession();
  // }

  // Future<void> _loadExistingSession() async {
  //   await SessionManager.load();
  //   if (SessionManager.isLoggedIn) setState(() {});
  // }

  Future<void> _signInToSpotify() async {
    try {
      final result = await auth.signIn();

      await SessionManager.save(
        access: result["accessToken"],
        refresh: result["refreshToken"],
      );

      setState(() {});
    } catch (e) {
      print("Auth failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (SessionManager.isLoggedIn) {
      return CenterFeature(
        icon: Icons.person,
        label: SessionManager.userData!["display_name"] ?? "",
      );
    }

    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1DB954),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        ),
        onPressed: _signInToSpotify,
        child: const Text("Sign in with Spotify"),
      ),
    );
  }
}
