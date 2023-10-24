import 'package:flutter/material.dart';
import '../../../components/dish_row_tile.dart';
import '../../../data_model/rating_db.dart';
import '../../../data_model/dish_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'expand_rating_view.dart';

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
                          child: Column(children: [
                            Center(
                              child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  height: 200.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(image: AssetImage(rating.picture), fit: BoxFit.cover),
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
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //Center Row contents horizontally,
                              // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                InputChip(
                                  avatar: const Icon(Icons.energy_savings_leaf),
                                  label: const Text('Vegan'),
                                  backgroundColor:
                                  Theme.of(context).primaryColor.withAlpha(95),
                                ),
                                InputChip(
                                  avatar:
                                      const Icon(Icons.assistant_photo_rounded),
                                  label: const Text('Local'),
                                  backgroundColor: rating.tags.contains('local')
                                      ? Theme.of(context)
                                          .primaryColor
                                          .withAlpha(95)
                                      : Theme.of(context)
                                          .primaryColor
                                          .withAlpha(50),
                                ),
                                InputChip(
                                  avatar:
                                      const Icon(Icons.auto_awesome_rounded),
                                  label: const Text('Vegetarian'),
                                  backgroundColor:
                                      rating.tags.contains('vegetarian')
                                          ? Theme.of(context)
                                              .primaryColor
                                              .withAlpha(95)
                                          : Theme.of(context)
                                              .primaryColor
                                              .withAlpha(50),
                                ),
                              ],
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
                            IconButton(
                              icon: const Icon(Icons.create_outlined),
                              tooltip: 'Edit your rating',
                              onPressed: () {

                              },
                            ),
                          ]),
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
