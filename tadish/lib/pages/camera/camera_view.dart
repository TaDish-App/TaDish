import 'package:flutter/material.dart';
import '../../components/drawer_view.dart';
import '../../pages/home/bodies/add_dish_form/camera_body_view.dart';

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

