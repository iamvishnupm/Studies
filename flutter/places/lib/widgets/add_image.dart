import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:transparent_image/transparent_image.dart";

class AddImage extends StatefulWidget {
  final void Function(File image) saveImage;
  const AddImage({
    //
    super.key,
    required this.saveImage,
  });

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _image;

  void _loadImage() async {
    var ximage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (ximage == null) return;

    setState(() {
      _image = File(ximage.path);
    });
    widget.saveImage(_image!);
  }

  @override
  Widget build(context) {
    //

    Text imageLabel = Text("Select Image");
    Color bgShadow = Colors.transparent;

    Widget imagePreview = Image.memory(
      kTransparentImage,
      width: double.infinity,
      height: double.infinity,
    );

    if (_image != null) {
      imagePreview = Image.file(
        _image!,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      );
      imageLabel = Text("Change Image");
      bgShadow = Colors.black87.withAlpha(125);
    }

    return GestureDetector(
      onTap: _loadImage,
      child: Container(
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white70.withAlpha(75)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              imagePreview,
              Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: bgShadow),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera),
                    SizedBox(width: 8),
                    imageLabel,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
