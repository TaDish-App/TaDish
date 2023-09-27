import 'package:flutter/material.dart';

import '../../pages/home/bodies/news_body_view.dart';
import 'bodies/gardens_body_view.dart';

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
      'title': const Text('News'),
      'body': const NewsBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'News',
        icon: Icon(Icons.newspaper),
      ),
    },
    1: {
      'title': const Text('Gardens'),
      'body': const GardensBodyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Gardens',
        icon: Icon(Icons.yard_outlined),
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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
