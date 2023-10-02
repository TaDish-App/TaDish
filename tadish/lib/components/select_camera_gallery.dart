import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'select_photo_options_screen.dart';

class SelectCameraGallery extends StatelessWidget {
  SelectCameraGallery({super.key});

  File? _image;

  Future _pickImage(ImageSource source) async {
    // try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      // img = await _cropImage(imageFile: img);
    //   setState(() {
    //     _image = img;
    //     Navigator.of(context).pop();
    //   });
    // } on PlatformException catch (e) {
    //   print(e);
    //   Navigator.of(context).pop();
    // }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _showSelectPhotoOptions(context);
        },
        child: Center(
          child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: Center(
                child: _image == null
                    ? const Text(
                  'No image selected',
                  style: TextStyle(fontSize: 20),
                )
                    : CircleAvatar(
                  backgroundImage: FileImage(_image!),
                  radius: 200.0,
                ),
              )),
        ),
      ),
    );
  }
}
