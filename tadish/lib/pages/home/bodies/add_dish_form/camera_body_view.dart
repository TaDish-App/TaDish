import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:path/path.dart';
import '../../../../components/circle_image_selector.dart';
import '../../../../components/slider.dart';
import '../../../../components/star_confetti.dart';

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
              const CircleImageSelector(),
              const SizedBox(
                height: 25,
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // TODO Add this to a field that the form can use
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //Center Row contents horizontally,
                // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  InputChip(
                    avatar: const Icon(Icons.energy_savings_leaf),
                    label: const Text('Vegan'),
                    onSelected: (bool value) {},
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(95),
                  ),
                  InputChip(
                    avatar: const Icon(Icons.assistant_photo_rounded),
                    label: const Text('Local'),
                    onSelected: (bool value) {},
                  ),
                  InputChip(
                    avatar: const Icon(Icons.auto_awesome_rounded),
                    label: const Text('Vegetarian'),
                    onSelected: (bool value) {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // TODO Change TextFormField to modals instead, else screen overflow
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Public Notes',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Private Notes',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //Center Row contents horizontally,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).primaryColor.withAlpha(98),
                    ),
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => const Dialog(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                    "How did it taste to you?"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sweetness"),
                                SliderExample(color: Colors.blue),
                                Text("Sourness"),
                                SliderExample(color: Colors.lime),
                                Text("Spiciness"),
                                SliderExample(color: Colors.deepOrange),
                                Text("Saltiness"),
                                SliderExample(color: Colors.blueGrey),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text('Add Details'),
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
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const StarConfetti(),
                                      const SizedBox(height: 15),
                                      const Text(
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20),
                                          'Nice one! Kimchi Fried Rice recorded!'),
                                      const SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                    // TODO Make a function to clear form
                                  ),
                                ),
                              ));
                    },
                    child: const Text('Add Dish'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
