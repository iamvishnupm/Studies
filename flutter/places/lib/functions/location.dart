import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

Future<LatLng?> getCurrentLocation() async {
  final location = Location();

  if (!await location.serviceEnabled()) {
    if (!await location.requestService()) return null;
  }

  var permission = await location.hasPermission();
  if (permission == PermissionStatus.denied) {
    permission = await location.requestPermission();
    if (permission != PermissionStatus.granted) return null;
  }

  final data = await location.getLocation();

  if (data.latitude == null || data.longitude == null) return null;

  return LatLng(data.latitude!, data.longitude!);
}
