import "package:flutter/material.dart";

import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";

import "package:places/config/app_config.dart";

class LocationPreview extends StatelessWidget {
  final LatLng point;
  final MapController controller;

  final String _mapTilerKey = AppConfig.mapTilerKey;

  LocationPreview({
    //
    super.key,
    required this.point,
    required this.controller,
  });

  @override
  Widget build(context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: point,
        initialZoom: 15,
        interactionOptions: const InteractionOptions(
          // flags: InteractiveFlag.none,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=$_mapTilerKey",
          userAgentPackageName: 'com.example.places',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: point,
              width: 40,
              height: 40,
              child: const Icon(Icons.location_pin, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
