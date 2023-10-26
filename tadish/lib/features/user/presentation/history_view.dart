import 'package:flutter/material.dart';
import 'package:tadish/features/common/star_rating_static.dart';
import '../../common/dish_row_tile.dart';
import '../../ratings/domain/rating_db.dart';
import '../../review/domain/dish_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ratings/presentation/editing_view.dart';
import '../../common/inactive_slider.dart';

class HistoryView extends ConsumerWidget {
  final String userID;

  const HistoryView({super.key, required this.userID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingsDB = ref.watch(ratingsDBProvider);
    final dishDB = ref.watch(dishDBProvider);
    final List<RatingData> ratings = ratingsDB.getSingularUserRatings(userID);

    return ratings.isNotEmpty
        ? ListView(
            children: ratings
                .map(
                  (rating) => GestureDetector(
                    child: DishRowTile(
                        imageUrl: rating.picture,
                        dishName: dishDB.getDishName(rating.dishID),
                        restaurantName:
                            dishDB.getDishRestaurantName(rating.dishID),
                        starRating: rating.starRating,
                        ratingDateTime: rating.createdOn),
                    onTap: () {
                      // open modal with expanded view
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: ListView(children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: const Icon(Icons.create_outlined),
                                  tooltip: 'Edit your rating',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      EditingView.routeName,
                                      arguments: rating.id,
                                    );
                                  },
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  height: 200.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(
                                        image: AssetImage(rating.picture),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Text(
                                dishDB.getDishName(rating.dishID),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 2,
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                dishDB.getDishRestaurantName(rating.dishID),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              StarRatingStatic(starRating: rating.starRating),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                //Center Row contents horizontally,
                                // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                children: [
                                  InputChip(
                                    avatar:
                                        const Icon(Icons.energy_savings_leaf),
                                    label: const Text('Vegan'),
                                    selected: rating.tags.contains("vegan"),
                                    showCheckmark: false,
                                    selectedColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(95),
                                  ),
                                  InputChip(
                                    avatar: const Icon(
                                        Icons.assistant_photo_rounded),
                                    label: const Text('Local'),
                                    selected: rating.tags.contains("local"),
                                    showCheckmark: false,
                                    selectedColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(95),
                                  ),
                                  InputChip(
                                    avatar:
                                        const Icon(Icons.auto_awesome_rounded),
                                    label: const Text('Vegetarian'),
                                    selected:
                                        rating.tags.contains("vegetarian"),
                                    showCheckmark: false,
                                    selectedColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(95),
                                  ),
                                ],
                              ),
                              const Text("Sweetness"),
                              InactiveSliderExample(
                                color: Colors.pink,
                                value: rating.sweetness!,
                              ),
                              const Text("Sourness"),
                              InactiveSliderExample(
                                color: Colors.lime,
                                value: rating.sourness!,
                              ),
                              const Text("Spiciness"),
                              InactiveSliderExample(
                                color: Colors.orange,
                                value: rating.spiciness!,
                              ),
                              const Text("Saltiness"),
                              InactiveSliderExample(
                                color: Colors.blueGrey,
                                value: rating.saltiness!,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Public Note: ${rating.publicNote}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Private Note: ${rating.privateNote}"),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                )
                .toList())
        : const Center(
            child: Text("You haven't rated a dish yet!"),
          );
  }
}
