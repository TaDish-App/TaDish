import 'package:flutter/material.dart';

import '../../pages/home/bodies/feed_body_view.dart';
import 'bodies/recommendation_body_view.dart';
import 'bodies/profile_body_view.dart';
import 'bodies/surprise_body_view.dart';

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
      'body': const FeedBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Feed',
        icon: Icon(Icons.feed_outlined),
      ),
    },
    1: {
      'title': const Text('Recommendation'),
      'body': const RecommendationBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Recommendation',
        icon: Icon(Icons.recommend_outlined),
      ),
    },
    2: {
      'title': const Text('Surprise'),
      'body': const SurpriseBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Surprise',
        icon: Icon(Icons.lightbulb_circle_outlined),
      ),
    },
    3: {
      'title': const Text('Profile'),
      'body': const ProfileBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Profile',
        icon: Icon(Icons.person_outline),
      ),
    },
  };

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

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
      body: widget.pages[_selectedIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // needed when more than 3 items
        items: [
          widget.pages[0]['navItem'],
          widget.pages[1]['navItem'],
          widget.pages[2]['navItem'],
          widget.pages[3]['navItem'],
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
