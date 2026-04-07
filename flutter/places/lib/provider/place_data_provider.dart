import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hive/hive.dart";
import "package:latlong2/latlong.dart";
import "package:path_provider/path_provider.dart" as syspath;
import "package:path/path.dart" as path;
import "package:places/models/places.dart";

class PlaceNotifier extends Notifier<List<Place>> {
  @override
  List<Place> build() {
    //

    // this is a hack - don't use this on production.
    // in production - use AsyncNotifier.
    Future.microtask(() => loadPlaces());
    // ------------

    return [];
  }

  void loadPlaces() async {
    final box = Hive.box('places');
    final entries = box.values.toList();

    final placeList = entries.map((row) {
      final entry = Map<String, dynamic>.from(row as Map);
      return Place(
        entry['title'] as String,
        File(entry['image'] as String),
        LatLng(
          (entry['lat'] as num).toDouble(),
          (entry['long'] as num).toDouble(),
        ),
        id: entry['id'] as String,
      );
    }).toList();

    state = placeList;
  }

  void addPlace(Place place) async {
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(place.image.path);

    final copiedImage = await place.image.copy("${appDir.path}/$filename");

    final newPlace = Place(place.title, copiedImage, place.location);

    final box = Hive.box('places');
    await box.put(newPlace.id, {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'long': newPlace.location.longitude,
    });

    state = [newPlace, ...state];
  }
}

final placeListProvider = NotifierProvider<PlaceNotifier, List<Place>>(
  () => PlaceNotifier(),
);
