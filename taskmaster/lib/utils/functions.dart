import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

// ----------------------------------------------------------------------------

String formatTime(DateTime t) {
  String h = t.hour.toString().padLeft(2, "0");
  String m = t.minute.toString().padLeft(2, "0");
  String s = t.second.toString().padLeft(2, "0");
  return "$h:$m:$s";
}

// ----------------------------------------------------------------------------

Future<TimeOfDay?> pickTime(BuildContext context, TimeOfDay initial) {
  return showTimePicker(context: context, initialTime: initial);
}

// ----------------------------------------------------------------------------

Future<Map<String, dynamic>> fetchSpotifyUser(String accessToken) async {
  final url = Uri.parse('https://api.spotify.com/v1/me');

  final resp = await http.get(
    url,
    headers: {'Authorization': 'Bearer $accessToken'},
  );

  if (resp.statusCode != 200) {
    throw Exception('Failed to load profile: ${resp.statusCode} ${resp.body}');
  }

  return json.decode(resp.body) as Map<String, dynamic>;
}

// ----------------------------------------------------------------------------

void loadScreen1(BuildContext context, Widget screen) {
  // loadScreen(context, MusicScreen());
  Navigator.push(
    //
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}

void loadScreen2(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      opaque: true,
      // transitionsBuilder: (_, animation, __, child) {
      //   return FadeTransition(opacity: animation, child: child);
      // },
      // transitionDuration: const Duration(milliseconds: 220),
    ),
  );
}

// ----------------------------------------------------------------------------
