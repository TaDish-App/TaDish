import 'package:flutter/material.dart';
import 'inactive_slider.dart';

class DishCard extends StatelessWidget {
  final String picture;
  final String name;
  final double sweetness;
  final double sourness;
  final double spiciness;
  final double saltiness;
  final String numRaters;

  const DishCard({
    Key? key,
    required this.picture,
    required this.name,
    required this.sweetness,
    required this.sourness,
    required this.spiciness,
    required this.saltiness,
    required this.numRaters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 350.0,
                    child: picture.startsWith("assets/images")
                        ? Image.asset(picture, fit: BoxFit.cover)
                        : Image.network(picture, fit: BoxFit.cover),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Text(name),
                        const Icon(Icons.emoji_people, size: 20),
                        Text(numRaters),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Sweetness"),
                            InactiveSliderExample(
                              color: Colors.blue,
                              value: sweetness,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Sourness"),
                            InactiveSliderExample(
                              color: Colors.lime,
                              value: sourness,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Spiciness"),
                            InactiveSliderExample(
                              color: Colors.orange,
                              value: spiciness,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Saltiness"),
                            InactiveSliderExample(
                              color: Colors.blueGrey,
                              value: saltiness,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
