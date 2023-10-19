import 'package:flutter/material.dart';
import '../../components/drawer_view.dart';
import '../../pages/home/bodies/surprise_body_view.dart';

class SurpriseView extends StatelessWidget {

  static const routeName = '/surprise';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Surprise'),
      ),
      body: SurpriseBodyView(),
    );
  }
}

