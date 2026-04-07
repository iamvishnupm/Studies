import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import "package:places/functions/location.dart";
import "package:places/screens/map_screen.dart";
import 'package:places/widgets/location_preview.dart';

class AddLocation extends StatefulWidget {
  final void Function(LatLng location) saveLocation;
  const AddLocation({
    //
    super.key,
    required this.saveLocation,
  });

  @override
  State<AddLocation> createState() => AddLocationState();
}

class AddLocationState extends State<AddLocation> {
  LatLng? point;
  final MapController _mapController = MapController();

  Future<void> _selectLocation() async {
    final newPoint = await getCurrentLocation();

    if (newPoint == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
            "Error fetching location!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }
    setState(() {
      point = newPoint;
    });

    widget.saveLocation(newPoint);

    _mapController.move(newPoint, 15);
  }

  @override
  Widget build(BuildContext context) {
    Widget preview;

    if (point == null) {
      preview = const Center(child: Text("No location selected"));
    } else {
      preview = LocationPreview(point: point!, controller: _mapController);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white70.withAlpha(75)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: preview,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: _selectLocation,
                label: const Text("Current Location"),
                icon: const Icon(Icons.location_on),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  //
                  final LatLng? newPoint = await Navigator.of(context).push(
                    MaterialPageRoute(
                      //
                      builder: (ctx) => MapScreen(
                        currentPoint: point,
                        mapController: _mapController,
                      ),
                    ),
                  );

                  setState(() {
                    point = newPoint;
                  });
                },
                label: const Text("Select from map"),
                icon: const Icon(Icons.map_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
