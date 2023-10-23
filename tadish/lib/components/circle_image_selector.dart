import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_gallery_choice_modal.dart';

class CircleImageSelector extends StatefulWidget {
  final FormFieldState<dynamic> field;

  const CircleImageSelector({super.key, required this.field});

  @override
  State<CircleImageSelector> createState() => _CircleImageSelectorState();
}

class _CircleImageSelectorState extends State<CircleImageSelector> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    Future<File?> cropImage({required File imageFile}) async {
      CroppedFile? croppedImage =
          await ImageCropper().cropImage(sourcePath: imageFile.path);
      if (croppedImage == null) return null;
      return File(croppedImage.path);
    }

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        File? img = File(image.path);
        img = await cropImage(imageFile: img);
        setState(() {
          _image = img;
          widget.field.didChange(img.toString());
          Navigator.of(context).pop();
        });
      } on PlatformException catch (e) {}
    }

    void showSelectPhotoOptions(BuildContext context) {
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
                child: CameraGalleryChoiceModal(
                  onTap: pickImage,
                ),
              );
            }),
      );
    }

    // to reset the image shown in the image display
    _image = widget.field.value == null ? null : _image;

    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          showSelectPhotoOptions(context);
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
