import 'package:flutter/material.dart';
import '../../../components/inactive_slider.dart';

class ItemCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String cost;
  final double sweetness;
  final double sourness;
  final double spiciness;
  final double saltiness;
  final String people;

  ItemCard({
    required this.image,
    required this.title,
    required this.cost,
    required this.sweetness,
    required this.sourness,
    required this.spiciness,
    required this.saltiness,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 400.0,
                child: Ink.image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Text(title),
                    const Icon(Icons.emoji_people, size: 20),
                    Text(people),
                  ]
                ),
                subtitle: Text('Total $cost'),
              ),
              Text("Sweetness"),
              InactiveSliderExample(
                  color: Colors.blue,
                  value: sweetness,
              ),
              Text("Sourness"),
              InactiveSliderExample(
                color: Colors.lime,
                value: sourness,
              ),
              Text("Spiciness"),
              InactiveSliderExample(
                color: Colors.orange,
                value: spiciness,
              ),
              Text("Saltiness"),
              InactiveSliderExample(
                color: Colors.blueGrey,
                value: saltiness,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
