import 'package:flutter/material.dart';
import '../../components/drawer_view.dart';
import '../../pages/home/bodies/profile_body_view.dart';

class ProfileView extends StatelessWidget {

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const ProfileBodyView(),
    );
  }
}

