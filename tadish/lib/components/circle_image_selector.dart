import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_gallery_choice_modal.dart';

class CircleImageSelector extends StatefulWidget {
  final Key fieldKey;

  const CircleImageSelector({super.key, required this.fieldKey});

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
          // field.didChange(img);
          print(img);
          Navigator.of(context).pop();
        });
      } on PlatformException catch (e) {
        print(e);
        Navigator.of(context).pop();
      }
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

    return FormBuilderField(
        name: 'Stars Field',
        key: widget.fieldKey,
        initialValue: 3.0,
        validator:
            FormBuilderValidators.compose([FormBuilderValidators.required()]),
        builder: (FormFieldState<dynamic> field) {
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
        });
  }
}
