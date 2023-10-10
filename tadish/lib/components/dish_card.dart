import 'package:flutter/material.dart';
import '../../../components/inactive_slider.dart';

class DishCard extends StatelessWidget {
  final AssetImage picture;
  final String name;
  final String cost;
  final double sweetness;
  final double sourness;
  final double spiciness;
  final double saltiness;
  final String numRaters;

  const DishCard({super.key,
    required this.picture,
    required this.name,
    required this.cost,
    required this.sweetness,
    required this.sourness,
    required this.spiciness,
    required this.saltiness,
    required this.numRaters,
  });

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
                  height: 400.0,
                  child: Ink.image(
                    image: picture,
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Row(
                      children: [
                        Text(name),
                        const Icon(Icons.emoji_people, size: 20),
                        Text(numRaters),
                      ]
                  ),
                  subtitle: Text('Total $cost'),
                ),
                const Text("Sweetness"),
                InactiveSliderExample(
                  color: Colors.blue,
                  value: sweetness,
                ),
                const Text("Sourness"),
                InactiveSliderExample(
                  color: Colors.lime,
                  value: sourness,
                ),
                const Text("Spiciness"),
                InactiveSliderExample(
                  color: Colors.orange,
                  value: spiciness,
                ),
                const Text("Saltiness"),
                InactiveSliderExample(
                  color: Colors.blueGrey,
                  value: saltiness,
                ),
                const Text("Saltiness"),
                InactiveSliderExample(
                  color: Colors.blueGrey,
                  value: saltiness,
                ),
              ],
            ),
          ),
        ),
      ),
      ]
    );
  }
}
