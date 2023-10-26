import 'package:flutter/material.dart';
import '../../common/drawer_view.dart';
import 'surprise_body_view.dart';

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

