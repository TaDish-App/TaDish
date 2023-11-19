import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../home/presentation/home_view.dart';
import 'decorations.dart';

class SignInView extends StatelessWidget {
 const SignInView({super.key});
 
 static const routeName = '/signin';

 @override
 Widget build(BuildContext context) {
   return StreamBuilder<User?>(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return SignInScreen(
           providers: [
             EmailAuthProvider(),
           ],
           headerBuilder: headerImage('assets/images/cloche_dark.png'),
           sideBuilder: sideImage('assets/images/cloche_dark.png'),
           subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to TaDish! Please sign in.'
                      : 'Welcome to TaDish! Please create an account.',
                ),
              );
              },
           footerBuilder: (context, action) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'By signing in, you agree to our terms and conditions.'
                        : 'By registering, you agree to our terms and conditions.',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              );
            },
         );
       }
       return HomeView();
     },
   );
 }
}