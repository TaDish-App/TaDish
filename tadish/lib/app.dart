import 'package:flutter/material.dart';
import 'pages/edit/editing_view.dart';
import 'pages/signin/signin_view.dart';
import 'pages/signup/signup_view.dart';
import 'pages/home/home_view.dart';
import 'pages/landing/landing_view.dart';
import 'pages/feed/feed_view.dart';
import 'pages/camera/camera_view.dart';
import 'pages/recommendation/recommendation_view.dart';
import 'pages/surprise/surprise_view.dart';
import 'pages/profile/profile_view.dart';
import 'pages/friends_list/friends_list_view.dart';
import 'settings/settings_view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentTheme = ref.watch(currentThemeModeProvider);
    return MaterialApp(
          theme: FlexThemeData.light(scheme: FlexScheme.espresso),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.espresso),
          themeMode: currentTheme,
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
                    return const SettingsView();
                  case SigninView.routeName:
                    return SigninView();
                  case SignupView.routeName:
                    return const SignupView();
                  case FeedView.routeName:
                    return FeedView();
                  case ProfileView.routeName:
                    return ProfileView();
                  case RecommendationView.routeName:
                    return RecommendationView();
                  case SurpriseView.routeName:
                    return SurpriseView();
                  case CameraView.routeName:
                    return CameraView();
                  case FriendsListView.routeName:
                    return FriendsListView();
                  case EditingView.routeName:
                    return EditingView();
                  default:
                    return SigninView();
                }
              },
            );
          },
        );
      }
}
