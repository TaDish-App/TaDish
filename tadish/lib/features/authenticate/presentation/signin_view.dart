import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadish/features/user/data/user_providers.dart';
import 'package:tadish/features/user/domain/user_collection.dart';
import 'form-fields/email_field.dart';
import 'form-fields/submit_button.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';

import '../../user/domain/user.dart';
import '../../user/data/user_providers.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class SigninView extends ConsumerWidget {
  SigninView({Key? key}) : super(key: key);

  static const routeName = '/signin';

  final _formKey = GlobalKey<FormBuilderState>();
  final _emailKey = GlobalKey<FormBuilderFieldState>();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> asyncUser = ref.watch(usersProvider);
    return asyncUser.when(data: (user) {
      return _build(context: context, users: user, ref: ref);
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
      required List<User> users,
      required WidgetRef ref}) {
      print("build");
      void onSubmit() {
        bool validEmailAndPassword =
        _formKey.currentState?.saveAndValidate() ?? false;
        final UserCollection userDB = UserCollection(users);
  
        if (validEmailAndPassword) {
          String email = _formKey.currentState?.value['email'];
          if (userDB.isUserEmail(email)) {
            String userID = userDB.getUserID(email);
            print(userID);
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Unknown User, try one of: ${userDB.getAllEmails().join(', ')}"),
              duration: const Duration(seconds: 10),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Invalid Email or Password.'),
            duration: Duration(seconds: 2),
          ));
        }
      }
  
      return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 40.0),
              Column(
                children: <Widget>[
                  Image.asset('assets/images/cloche_dark.png', width: 200),
                  const SizedBox(height: 16.0),
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Login to your account",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 120.0),
              FormBuilder(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    EmailField(fieldKey: _emailKey),
                    const SizedBox(height: 10),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                height: 40,
                child: SubmitButton(onSubmit: onSubmit),
              ),
              const SizedBox(height: 12.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account? "),
                TextButton(
                  child: const Text('Sign up'),
                  onPressed: () {
                    // Eventually: pushReplacementNamed
                    Navigator.pushNamed(context, '/signup');
                  },
                )
              ]),
            ],
          ),
        ),
      );
    }
}
