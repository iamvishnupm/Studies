import "dart:io";

import "package:flutter/material.dart";
import "package:latlong2/latlong.dart";
import "package:places/models/places.dart";
import "package:places/widgets/add_image.dart";
import "package:places/widgets/add_location.dart";

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  //

  String _placeTitle = '';
  File? _image;
  LatLng? _location;

  void saveImage(File image) {
    _image = image;
  }

  void saveLocation(LatLng location) {
    _location = location;
  }

  // ======================================

  final _formKey = GlobalKey<FormState>();

  void _checkForm() {
    if (!_formKey.currentState!.validate()) return;

    if (_image == null) {
      //
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No image added!", style: TextStyle(color: Colors.red)),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (_location == null) {
      //
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "No location detected!",
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    _formKey.currentState!.save();
  }

  // ======================================

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: Text("Add Favorite Place"),
        actions: [
          IconButton(
            //
            onPressed: _checkForm,
            icon: Icon(Icons.check, size: 32),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //

                  //
                  TextFormField(
                    //
                    decoration: InputDecoration(labelText: "Place Title"),

                    maxLength: 20,

                    initialValue: _placeTitle,

                    validator: (value) =>
                        (value!.isEmpty) ? "Invalid Input" : null,

                    onSaved: (newValue) {
                      _placeTitle = newValue!;
                      Navigator.pop(
                        context,
                        Place(_placeTitle, _image!, _location!),
                      );
                    },

                    //
                  ),

                  //
                  SizedBox(height: 16),
                  AddImage(saveImage: saveImage),
                  SizedBox(height: 16),
                  AddLocation(saveLocation: saveLocation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
