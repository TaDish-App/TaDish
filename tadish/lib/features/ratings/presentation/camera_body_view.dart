import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tadish/features/home/presentation/home_view.dart';
import 'package:tadish/features/ratings/domain/rating.dart';
import 'package:tadish/features/ratings/presentation/add_rating_controller.dart';
import '../../common/star_confetti.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../data/rating_provider.dart';
import '../domain/rating_collection.dart';
import 'camera_view.dart';
import 'form-fields/images_field.dart';
import 'form-fields/single_line_text_field.dart';
import 'form-fields/slider_field.dart';
import 'form-fields/star_field.dart';
import 'form-fields/tags_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user/data/user_providers.dart';

import '../../common/form-fields/submit_button.dart';
import '../../user/domain/user.dart';

class CameraBodyView extends ConsumerWidget {
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
    final AsyncValue<List<Rating>> asyncRatingsDB = ref.watch(ratingsProvider);
    return asyncRatingsDB.when(data: (ratings) {
      print("data");
      return _build(context: context, ratings: ratings, ref: ref);
    }, loading: () {
      print("loading");
      return const TadishLoading();
    }, error: (error, stacktrace) {
      print("error");
      print(error.toString());
      return TadishError(error.toString(), stacktrace.toString());
    });
  }

  Widget _build(
      {required BuildContext context,
      required List<Rating> ratings,
      required WidgetRef ref}) {
    RatingCollection ratingCollection = RatingCollection(ratings);

    final String currentUserEmail = ref.watch(currentUserEmailProvider);

    displayConfirmationModal(String dishName) {
      return showDialog<String>(
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
                      Text(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                          'Nice one! Your rating for $dishName has been recorded!'),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ));
    }

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;

      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      double stars = _starsFieldKey.currentState?.value;
      String restaurantName = _restaurantNameFieldKey.currentState?.value;
      String dishName = _dishNameFieldKey.currentState?.value;
      List<String> tags = _tagsFieldKey.currentState?.value;
      String publicNotes = _publicNotesFieldKey.currentState?.value;
      String privateNotes = _privateNotesFieldKey.currentState?.value;
      double sweetnessSlider = _sliderSweetnessFieldKey.currentState?.value;
      double sournessSlider = _sliderSournessFieldKey.currentState?.value;
      double spicinessSlider = _sliderSpicinessFieldKey.currentState?.value;
      double saltinessSlider = _sliderSaltinessFieldKey.currentState?.value;
      String image = _imageFieldKey.currentState?.value;
      image = 'assets/images/2.jpg';

      String dishID = 'dish-001';
      int numRatings = ratingCollection.size();
      String id = 'rating-${(numRatings + 1).toString().padLeft(3, '0')}';

      Rating rating = Rating(
        id: id,
        dishID: dishID,
        raterEmail: currentUserEmail,
        starRating: stars,
        restaurantName: restaurantName,
        sweetness: sweetnessSlider,
        sourness: sournessSlider,
        saltiness: saltinessSlider,
        spiciness: spicinessSlider,
        tags: tags,
        picture: image,
        publicNote: publicNotes,
        privateNote: privateNotes,
        createdOn: DateTime.now().toString(),
      );

      // Add the new rating.
      ref.read(addRatingControllerProvider.notifier).addRating(
            rating: rating,
            dishName: dishName,
            restaurantName: restaurantName,
            onSuccess: () {
              // Navigator.pushReplacementNamed(context, HomeView.routeName);
              // GlobalSnackBar.show('Garden "$name" added.');
            },
          );

      // Reset form
      _formKey.currentState?.reset();

      // Display confirmation modal
      displayConfirmationModal(dishName);
    }

    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.fromLTRB(32, 15, 32, 32),
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // TODO Image picking
                    ImagesField(fieldKey: _imageFieldKey, name: "Image"),
                    // FieldPadding(
                    //     child: CircleImageSelector(fieldKey: _imageFieldKey)),
                    StarField(fieldKey: _starsFieldKey),
                    SingleLineTextField(
                        name: "Restaurant",
                        hint: "Enter the location",
                        fieldKey: _restaurantNameFieldKey),
                    SingleLineTextField(
                        name: "Dish Name",
                        hint: "Enter the dish name",
                        fieldKey: _dishNameFieldKey),
                    TagsField(name: "Tags", fieldKey: _tagsFieldKey),
                    Row(
                      children: [
                        Flexible(
                          child: SingleLineTextField(
                              name: "Public Notes",
                              hint: "Public Notes",
                              fieldKey: _publicNotesFieldKey),
                        ),
                        Flexible(
                          child: SingleLineTextField(
                              name: "Private Notes",
                              hint: "Private Notes",
                              fieldKey: _privateNotesFieldKey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SliderField(
                      fieldKey: _sliderSweetnessFieldKey,
                      name: "Sweetness",
                      color: Colors.pink,
                    ),
                    SliderField(
                      fieldKey: _sliderSournessFieldKey,
                      name: "Sourness",
                      color: Colors.lime,
                    ),
                    SliderField(
                      fieldKey: _sliderSpicinessFieldKey,
                      name: "Spiciness",
                      color: Colors.orange,
                    ),
                    SliderField(
                        fieldKey: _sliderSaltinessFieldKey,
                        name: "Saltiness",
                        color: Colors.blueGrey),
                  ],
                ),
              ),
              SubmitButton(
                  onSubmit: onSubmit, submissionText: "Submit a new Rating!"),
            ],
          )),
    );
  }
}
