import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadish/features/user/presentation/edit_user_controller.dart';
import '../../common/drawer_view.dart';
import '../../user/domain/user.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../../common/form-fields/submit_button.dart';
import 'form-fields/single_line_text_field.dart';

class CreateProfileView extends ConsumerWidget {

  static const routeName = '/createprofile';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
    
      String name = _nameFieldKey.currentState?.value;
      print(name);
    
      // User newUser = User(
      //   id: currentUser.id,
      //   name: name,
      //   username: currentUser.username,
      //   email: currentUser.email,
      //   tastePreference: currentUser.tastePreference,
      //   friendsIDList: friendslistID,
      //   savedDishesID: currentUser.savedDishesID,
      //   geolocation: currentUser.geolocation,
      //   role: currentUser.role,
      //   gender: currentUser.gender,
      //   age: currentUser.age,
      //   ethnicity: currentUser.ethnicity,
      //   createdOn: currentUser.createdOn,
      //   updatedOn: DateTime.now(),
      //   isActive: currentUser.isActive,
      //   taggedDishes: currentUser.taggedDishes
      // );
      // ref.read(editUserControllerProvider.notifier).updateUser(
      //       updatedUser: newUser,
      //       // TODO send old rating info e.g. star to help with avg calculations
      //       onSuccess: () {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //           const SnackBar(
      //             content: Text('Profile created successfully!'),
      //             duration: Duration(seconds: 2), // Adjust the duration as needed
      //           ),
      //         );
      //       },
      //     );
}

    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Create Profile'),
      ),
      body: Container(
        width: 200, // or any other finite width
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SingleLineTextField(
                name: "Your Name",
                hint: "Enter your name",
                fieldKey: _nameFieldKey,
              ),
              SubmitButton(
                onSubmit: onSubmit,
                submissionText: "create profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

