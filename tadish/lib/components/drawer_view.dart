import 'package:flutter/material.dart';
import 'package:tadish/pages/home/bodies/add_dish_form/camera_body_view.dart';
import 'package:tadish/pages/recommendation/recommendation_view.dart';

import '../pages/feed/feed_view.dart';
import '../pages/profile/profile_view.dart';
import '../pages/surprise/surprise_view.dart';
import '../pages/home/home_view.dart';
import '../pages/camera/camera_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Upload'),
            onTap: () {
              Navigator.pushReplacementNamed(context, CameraView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Feed'),
            onTap: () {
              Navigator.pushReplacementNamed(context, FeedView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.recommend_outlined),
            title: const Text('Recommendation'),
            onTap: () {
              Navigator.pushReplacementNamed(context, RecommendationView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_circle_outlined),
            title: const Text('Surprise'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SurpriseView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushReplacementNamed(context, ProfileView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'bad page');
            },
          ),
        ],
      ),
    );
  }
}
