import "package:flutter/material.dart";
import "package:taskmaster/services/spotify_auth.dart";
import "package:taskmaster/state/session_manager.dart";
import "package:taskmaster/widgets/center_feature.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = SpotifyAuth();

  Future<void> _signInToSpotify() async {
    try {
      await auth.signIn();

      print("Successsssssssssssssssssssssssssssssssssss");
      print("**********************************************");

      setState(() {});
    } catch (e) {
      print("Auth failed : $e");
    }
  }

  @override
  Widget build(context) {
    //

    if (SessionManager.isLoggedIn) {
      return CenterFeature(
        icon: Icons.person,
        label: SessionManager.userData!["display_name"] ?? "",
      );
    }
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1DB954),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        ),
        onPressed: _signInToSpotify,
        child: Text("Sign in to Spotify"),
      ),
    );
  }
}
