import 'package:flutter/material.dart';
import '../../custom_theme.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
          children: [
        Positioned.fill(
        child: Image.asset(
          'assets/images/background.jpg',
          fit: BoxFit.cover,
        ),
      ),
      SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 150.0),
            Column(
              children: <Widget>[
                Image.asset('assets/images/cloche_light.png', width: 300),
                const Text(
                  "TaDish",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Dish the Dish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100.0),
            ElevatedButton(
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: customPrimaryColor,
                  )
                ),
              ),

            const SizedBox(height: 12.0),
            ElevatedButton(
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushNamed(context, '/signup');
                },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20.0,
                  )
              ),
            )
          ],
        ),
      ),
    ],),
    );
  }
}
