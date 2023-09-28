import 'package:flutter/material.dart';

import 'pages/signin/signin_view.dart';
import 'pages/signup/signup_view.dart';
import 'pages/home/home_view.dart';
import 'pages/landing/landing_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'custom_theme.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: customTheme,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case LandingView.routeName:
                    return const LandingView();
                  case HomeView.routeName:
                    return HomeView();
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SigninView.routeName:
                    return const SigninView();
                  case SignupView.routeName:
                    return const SignupView();
                  default:
                    return const SigninView();
                }
              },
            );
          },
        );
      },
    );
  }
}
