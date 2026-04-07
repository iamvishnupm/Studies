import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:places/models/places.dart";
import "package:places/provider/place_data_provider.dart";

import "package:places/screens/add_place_screen.dart";
import "package:places/screens/saved_places.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  await Hive.openBox('places');

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavoritePlaces(),

        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
      ),
    ),
  );
}

class FavoritePlaces extends ConsumerStatefulWidget {
  const FavoritePlaces({super.key});

  @override
  ConsumerState<FavoritePlaces> createState() => _FavoritePlacesState();
}

class _FavoritePlacesState extends ConsumerState<FavoritePlaces> {
  //

  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     ref.read(placeListProvider.notifier).loadPlaces();
  //   });
  // }

  void _openAddPlaceScreen() async {
    Place? place = await Navigator.of(context).push(
      MaterialPageRoute(
        //
        builder: (context) => AddPlaceScreen(),
      ),
    );

    if (place != null) {
      ref.read(placeListProvider.notifier).addPlace(place);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Places"),
        actions: [
          IconButton(
            //
            onPressed: _openAddPlaceScreen,
            icon: Icon(Icons.add),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Center(child: SavedPlaces()),
    );
  }
}
