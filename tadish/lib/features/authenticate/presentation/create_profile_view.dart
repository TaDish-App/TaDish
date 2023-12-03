import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadish/features/user/presentation/edit_user_controller.dart';
import '../../common/drawer_view.dart';
import '../../user/data/user_providers.dart';
import '../../user/domain/user.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../../common/form-fields/submit_button.dart';
import 'form-fields/single_line_text_field.dart';
import '../../user_all_provider.dart';
import 'package:tadish/features/user/domain/user_collection.dart';
import '../../user/presentation/edit_user_controller.dart';
import 'form-fields/single_line_number_field.dart';
import 'verify_email_view.dart';
import 'form-fields/slider_field.dart';

class CreateProfileView extends ConsumerWidget {

  static const routeName = '/createprofile';
  final _formKey = GlobalKey<FormBuilderState>();
  final _usernameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _genderFieldKey = GlobalKey<FormBuilderFieldState>();
  final _ageFieldKey = GlobalKey<FormBuilderFieldState>();
  final _ethnicityFieldKey = GlobalKey<FormBuilderFieldState>();
  final _geolocationFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSweetnessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSournessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSaltinessFieldKey = GlobalKey<FormBuilderFieldState>();
  final _sliderSpicinessFieldKey = GlobalKey<FormBuilderFieldState>();
  
   @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserAll> asyncUserAll = ref.watch(userAllProvider);
    return asyncUserAll.when(data: (userALl) {
      return _build(context: context, userID: userALl.currentUserID, users: userALl.user, ref: ref);
    }, loading: () {
      print("loading");
      return const TadishLoading();
    }, error: (error, stacktrace) {
      print("error");
      print(error.toString());
      return TadishError(error.toString(), stacktrace.toString());
    });
  }
  
  @override
  Widget _build(
    {
      required BuildContext context, 
      required List<User> users,
      required String userID,
      required WidgetRef ref
    }) {
    final UserCollection userDB = UserCollection(users);
    int numUsers = userDB.size();
    String id = 'user-${(numUsers + 1).toString().padLeft(3, '0')}';
    String currentUserEmail = ref.watch(currentUserEmailProvider);
    
    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
    
      String username = _usernameFieldKey.currentState?.value;
      String name = _nameFieldKey.currentState?.value;
      String gender = _genderFieldKey.currentState?.value;
      int age = int.parse(_ageFieldKey.currentState?.value);
      String ethnicity = _ethnicityFieldKey.currentState?.value;
      String geolocation = _geolocationFieldKey.currentState?.value;
      double sweetnessSlider = _sliderSweetnessFieldKey.currentState?.value;
      double sournessSlider = _sliderSournessFieldKey.currentState?.value;
      double spicinessSlider = _sliderSpicinessFieldKey.currentState?.value;
      double saltinessSlider = _sliderSaltinessFieldKey.currentState?.value;
      User newUser = User(
        id: id,
        name: name,
        username: username,
        email: currentUserEmail,
        geolocation: geolocation,
        gender: gender,
        age: age,
        tastePreference: [sweetnessSlider/100, sournessSlider/100, spicinessSlider/100, saltinessSlider/100],
        ethnicity: ethnicity,
        createdOn: DateTime.now(),
        updatedOn: DateTime.now(),
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
            updatedUser: newUser,
            // TODO send old rating info e.g. star to help with avg calculations
            onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile created successfully!'),
                  duration: Duration(seconds: 2), // Adjust the duration as needed
                ),
              );
            Navigator.pushNamed(context, VerifyEmailView.routeName);
            },
          );
}

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container( // or any other finite width
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
            Image.asset('assets/images/logo_dark.png', width: 200),
                const SizedBox(height: 16.0),
                Text(
                  "Welcome!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Create your account",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
            const SizedBox(height: 20.0),
              SingleLineTextField(
                name: "Your Name",
                hint: "Enter your name",
                fieldKey: _nameFieldKey,
              ),
              SingleLineTextField(
                name: "Username",
                hint: "Enter your username",
                fieldKey: _usernameFieldKey,
              ),
              SingleLineTextField(
                name: "Gender",
                hint: "Enter your gender",
                fieldKey: _genderFieldKey,
              ),
              SingleLineNumberField(
                name: "Your Age",
                hint: "Enter your age",
                fieldKey: _ageFieldKey,
              ),
              SingleLineTextField(
                name: "Your Ethnicity",
                hint: "Enter your ethnicity",
                fieldKey: _ethnicityFieldKey,
              ),
              SingleLineTextField(
                name: "Your Location",
                hint: "Enter your location",
                fieldKey: _geolocationFieldKey,
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
              SubmitButton(
                onSubmit: onSubmit,
                submissionText: "create profile",
              ),
            ],
          ),
        ),
      ),
        )
      )
    );
  }
}

