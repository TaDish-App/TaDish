import 'package:flutter/material.dart';
import '../../common/drawer_view.dart';
import 'camera_body_view.dart';

class CameraView extends StatelessWidget {

  static const routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: CameraBodyView(),
    );
  }
}

