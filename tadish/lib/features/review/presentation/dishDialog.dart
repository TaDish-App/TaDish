import 'package:flutter/material.dart';
import '../../common/inactive_slider.dart';
import 'package:tadish/features/common/star_rating_static.dart';

class DishDialog extends StatelessWidget {
  final String imageUrl;
  final String dishName;
  final String restaurantName;
  final double starRating;
  final List<String> tags;
  final double averageSaltiness; 
  final double averageSourness;
  final double averageSpiciness;
  final double averageSweetness;
  final String publicNote;

  const DishDialog({
    super.key,
    required this.imageUrl,
    required this.dishName,
    required this.restaurantName,
    required this.starRating,
    required this.averageSaltiness,
    required this.averageSourness,
    required this.averageSpiciness,
    required this.averageSweetness,
    required this.publicNote,
    required this.tags,
  });
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(children: [
          Center(
            child: Container(
              margin:
              const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
                image: imageUrl.startsWith("assets/images") ? DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover) : DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            dishName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              height: 2,
              fontSize: 30,
            ),
          ),
          Text(
            restaurantName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StarRatingStatic(starRating: starRating),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            //Center Row contents horizontally,
            // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              if (tags.contains("vegan"))
              const InputChip(
                avatar: Icon(Icons.energy_savings_leaf),
                label: Text('Vegan'),
                selected: true,
                showCheckmark: false,),
              if (tags.contains("local"))
                const InputChip(
                  avatar: Icon(Icons.assistant_photo_rounded),
                  label: Text('Local'),
                  selected: true, // Adjust as needed based on your logic
                  showCheckmark: false,
                ),
            
              // InputChip for "Vegetarian"
              if (tags.contains("vegetarian"))
                const InputChip(
                  avatar: Icon(Icons.auto_awesome_rounded),
                  label: Text('Vegetarian'),
                  selected: true, // Adjust as needed based on your logic
                  showCheckmark: false,
                ),
            ],
          ),
          const Text("Sweetness"),
          InactiveSliderExample(
            color: Colors.pink,
            value: averageSaltiness,
          ),
          const Text("Sourness"),
          InactiveSliderExample(
            color: Colors.lime,
            value: averageSourness,
          ),
          const Text("Spiciness"),
          InactiveSliderExample(
            color: Colors.orange,
            value: averageSpiciness,
          ),
          const Text("Saltiness"),
          InactiveSliderExample(
            color: Colors.blueGrey,
            value: averageSaltiness,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Public Note: ${publicNote}"),
        ]),
      ),
    );
  }
}