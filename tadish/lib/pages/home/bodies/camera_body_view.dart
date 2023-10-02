import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../components/select_camera_gallery.dart';

/// Displays a list of Gardens.
/// CameraBodyView
class CameraBodyView extends StatefulWidget {
  const CameraBodyView({super.key});

  @override
  CameraBodyViewState createState() {
    return CameraBodyViewState();
  }
}

class CameraBodyViewState extends State<CameraBodyView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Dish Name
              const Text(
                'Kimchi Fried Rice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 2,
                  fontSize: 30,
                ),
              ),
              const Text(
                'HiTea Cafe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SelectCameraGallery(),
              const SizedBox(
                height: 25,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // TODO Add this to a field that the form can use
                  print(rating);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
                // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  InputChip(
                    avatar: Icon(Icons.energy_savings_leaf),
                    label: Text('Vegan'),
                    onSelected: (bool value) {},
                    backgroundColor: Theme.of(context).primaryColor.withAlpha(95),
                  ),
                  InputChip(
                    avatar: Icon(Icons.assistant_photo_rounded ),
                    label: Text('Local'),
                    onSelected: (bool value) {},
                  ),
                  InputChip(
                    avatar: Icon(Icons.auto_awesome_rounded),
                    label: Text('Vegetarian'),
                    onSelected: (bool value) {},
                  ),
                ],
              ),// Add TextFormFields and ElevatedButton here.
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Add Dish'),
              ),
            ],
          ),
        )
    );
  }
}
