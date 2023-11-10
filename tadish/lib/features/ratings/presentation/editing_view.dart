import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadish/features/review/domain/dish_db.dart';

import 'form-fields/images_field.dart';
import 'form-fields/single_line_text_field.dart';
import 'form-fields/slider_field.dart';
import 'form-fields/star_field.dart';
import 'form-fields/tags_field.dart';
import '../../common/form-fields/submit_button.dart';
import '../domain/rating_db.dart';
import '../../user/domain/user.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class EditingView extends ConsumerWidget {
  EditingView({Key? key}) : super(key: key);
  static const routeName = '/edit';

  final _formKey = GlobalKey<FormBuilderState>();
  final _starsFieldKey = GlobalKey<FormBuilderFieldState>();
  final _restaurantNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dishNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _imageFieldKey = GlobalKey<FormBuilderFieldState>();
  final _tagsFieldKey = GlobalKey<FormBuilderFieldState>();
  final _publicNotesFieldKey = GlobalKey<FormBuilderFieldState>();
  final _privateNotesFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSweetnessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSournessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSaltinessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSpicinessFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RatingsDB ratingsDB = ref.watch(ratingsDBProvider);
    final DishDB dishesDB = ref.watch(dishDBProvider);
    final String currentUser = ref.watch(currentUserIDProvider);

    final ratingID = ModalRoute.of(context)!.settings.arguments as String;
    final rating = ratingsDB.getRating(ratingID);
    final restaurantName = dishesDB.getDishRestaurantName(rating.dishID);
    final dishName = dishesDB.getDishName(rating.dishID);

    void onSubmit() {
      print("Editing a rating!");

      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;

      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      double stars = _starsFieldKey.currentState?.value;
      String restaurantName = _restaurantNameFieldKey
          .currentState?.value; // TODO any changes to this should update dishDB
      String dishName = _dishNameFieldKey.currentState?.value;
      List<String> tags = _tagsFieldKey.currentState?.value;
      String publicNotes = _publicNotesFieldKey.currentState?.value;
      String privateNotes = _privateNotesFieldKey.currentState?.value;
      double sweetnessSlider = _sliderSweetnessFieldKey.currentState?.value;
      double sournessSlider = _sliderSournessFieldKey.currentState?.value;
      double spicinessSlider = _sliderSpicinessFieldKey.currentState?.value;
      double saltinessSlider = _sliderSaltinessFieldKey.currentState?.value;
      String image = _imageFieldKey.currentState?.value;

      // Edit the rating.
      ratingsDB.editRating(
          name: dishName,
          starRating: stars,
          sweetness: sweetnessSlider,
          sourness: sournessSlider,
          saltiness: saltinessSlider,
          spiciness: spicinessSlider,
          tags: tags,
          picture: image,
          publicNote: publicNotes,
          privateNote: privateNotes,
          ratingID: ratingID,
          dishID: rating.dishID,
          raterID: rating.raterID,
          createdOn: rating.createdOn);

      // pop out back to view of rating
      Navigator.pop(context);
      Navigator.pop(context);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.fromLTRB(32, 15, 32, 32),
            child: Column(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // TODO Image picking
                      ImagesField(
                          fieldKey: _imageFieldKey,
                          name: "Image",
                          currImage: rating.picture),
                      StarField(
                          fieldKey: _starsFieldKey,
                          currStars: rating.starRating),
                      SingleLineTextField(
                        name: "Restaurant",
                        hint: "Enter the location",
                        fieldKey: _restaurantNameFieldKey,
                        currText: restaurantName,
                      ),
                      SingleLineTextField(
                        name: "Dish Name",
                        hint: "Enter the dish name",
                        fieldKey: _dishNameFieldKey,
                        currText: dishName,
                      ),
                      TagsField(
                          name: "Tags",
                          fieldKey: _tagsFieldKey,
                          currTags: rating.tags),
                      Row(
                        children: [
                          Flexible(
                            child: SingleLineTextField(
                                name: "Public Notes",
                                hint: "Public Notes",
                                fieldKey: _publicNotesFieldKey,
                                currText: rating.publicNote),
                          ),
                          Flexible(
                            child: SingleLineTextField(
                              name: "Private Notes",
                              hint: "Private Notes",
                              fieldKey: _privateNotesFieldKey,
                              currText: rating.privateNote,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SliderField(
                        fieldKey: _sliderSweetnessFieldKey,
                        name: "Sweetness",
                        color: Colors.pink,
                        currValue: rating.sweetness,
                      ),
                      SliderField(
                        fieldKey: _sliderSournessFieldKey,
                        name: "Sourness",
                        color: Colors.lime,
                        currValue: rating.sourness,
                      ),
                      SliderField(
                        fieldKey: _sliderSpicinessFieldKey,
                        name: "Spiciness",
                        color: Colors.orange,
                        currValue: rating.spiciness,
                      ),
                      SliderField(
                        fieldKey: _sliderSaltinessFieldKey,
                        name: "Saltiness",
                        color: Colors.blueGrey,
                        currValue: rating.saltiness,
                      ),
                    ],
                  ),
                ),
                SubmitButton(
                    onSubmit: onSubmit, submissionText: "Finalize Edits"),
              ],
            )),
      ),
    );
  }
}
