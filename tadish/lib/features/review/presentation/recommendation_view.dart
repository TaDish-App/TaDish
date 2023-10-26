import 'package:flutter/material.dart';
import '../../common/drawer_view.dart';
import 'recommendation_body_view.dart';

class RecommendationView extends StatelessWidget {

  static const routeName = '/recommendation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Recommendation'),
      ),
      body: RecommendationBodyView(),
    );
  }
}

