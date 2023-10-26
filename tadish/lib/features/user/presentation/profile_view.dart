import 'package:flutter/material.dart';
import '../../common/drawer_view.dart';
import 'profile_body_view.dart';

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

