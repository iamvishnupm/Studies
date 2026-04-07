import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:places/provider/place_data_provider.dart";

class SavedPlaces extends ConsumerWidget {
  const SavedPlaces({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeListProvider);

    return ListView.builder(
      padding: EdgeInsets.only(top: 16),
      itemCount: places.length,
      itemBuilder: (context, index) {
        //

        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(places[index].title),

          contentPadding: EdgeInsets.all(16),
        );
      },
    );
  }
}
