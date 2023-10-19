import 'package:flutter/material.dart';
import '../../components/drawer_view.dart';
import '../../pages/home/bodies/feed_body_view.dart';

class FeedView extends StatelessWidget {

  static const routeName = '/feed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: FeedBodyView(),
    );
  }
}

