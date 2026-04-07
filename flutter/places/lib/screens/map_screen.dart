import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";
import "package:places/functions/location.dart";
import "package:places/widgets/location_preview.dart";

class MapScreen extends StatefulWidget {
  final LatLng? currentPoint;
  final MapController mapController;

  const MapScreen({
    //
    super.key,
    this.currentPoint,
    required this.mapController,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //

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

    _mapController.move(newPoint, 15);
  }

  @override
  void initState() {
    super.initState();

    if (widget.currentPoint == null) _selectLocation();

    setState(() {
      point = widget.currentPoint;
    });
  }

  @override
  Widget build(context) {
    Text buttonLabel;

    if (point == null) {
      buttonLabel = Text("Current Location");
    } else {
      buttonLabel = Text("Re-center");
    }

    return PopScope(
      canPop: false, // be careful when changing this.
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.pop(context, point);
      },

      //
      child: Scaffold(
        appBar: AppBar(title: Text("Location")),
        body: Stack(
          children: [
            //
            LocationPreview(
              point: point ?? LatLng(0, 0),
              controller: _mapController,
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: ElevatedButton.icon(
                onPressed: _selectLocation,
                label: buttonLabel,
                icon: Icon(Icons.location_on),
              ),
            ),
          ],
        ),
      ),

      //
    );
  }
}
