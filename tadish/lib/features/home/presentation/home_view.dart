import 'package:flutter/material.dart';

import '../../common/drawer_view.dart';
import '../../review/presentation/saved_body_view.dart';
import '../../review/presentation/recommendation_body_view.dart';
import '../../user/presentation/profile_body_view.dart';
import '../../picker/presentation/surprise_body_view.dart';
import '../../ratings/presentation/camera_body_view.dart';
import '../../../custom_theme.dart';

/// Top-level Layout for all of the "Home" related
class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });

  static const routeName = '/home';

  // This data structure will eventually become stateful and thus will
  // need to be moved into the state widget.
  final Map pages = {
    0: {
      'title': const Text('Feed'),
      'body': FeedBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.bookmark, size: 40),
      ),
    },
    1: {
      'title': const Text('Recommendation'),
      'body': RecommendationBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.recommend_outlined, size: 40),
      ),
    },
    2: {
      'title': const Text('Camera'),
      'body': CameraBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.camera, size: 40),
      ),
    },
    3: {
      'title': const Text('Surprise'),
      'body': SurpriseBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.lightbulb_circle_outlined, size: 40),
      ),
    },
    4: {
      'title': const Text('Profile'),
      'body': const ProfileBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: '',
        icon: Icon(Icons.person_outline, size: 40),
      ),
    },
  };

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: widget.pages[_selectedIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // needed when more than 3 items
        items: [
          widget.pages[0]['navItem'],
          widget.pages[1]['navItem'],
          widget.pages[2]['navItem'],
          widget.pages[3]['navItem'],
          widget.pages[4]['navItem'],
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: customPrimaryColor,
        unselectedItemColor: Colors.black38,
      ),
    );
  }
}
