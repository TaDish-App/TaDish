import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tadish/features/review/domain/dish.dart';
import 'package:tadish/features/ratings/domain/rating.dart';
import 'package:tadish/features/user/domain/user.dart';
import '../../common/Tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dish_rating_user_data_provider.dart';
import '../../ratings/data/rating_provider.dart';
import '../../ratings/domain/rating_collection.dart';
import '../../review/domain/dish_collection.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import '../../user/data/user_providers.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DishRatingUser> asyncDishRatingUserData =
        ref.watch(dishRatingUserProvider);
    // final AsyncValue<List<Rating>> asyncRatingsDB = ref.watch(ratingsProvider);

    // return asyncRatingsDB.when(
    //     data: (ratings){
    //       print("data");
    //       return _build(context: context, ratings: ratings, ref: ref);
    //     },
    //     loading: () => const TadishLoading(),
    //     error: (error, stacktrace) =>
    //         TadishError(error.toString(), stacktrace.toString()));
    return asyncDishRatingUserData.when(
        data: (dishRatingUserData) => _build(
            context: context,
            currentUserEmail: dishRatingUserData.currentUserEmail,
            ratings: dishRatingUserData.ratings,
            dishes: dishRatingUserData.dishes,
            ref: ref),
        loading: () => const TadishLoading(),
        error: (error, stacktrace) =>
            TadishError(error.toString(), stacktrace.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required List<Rating> ratings,
      required List<Dish> dishes,
      required String currentUserEmail,
      required WidgetRef ref}) {
    RatingCollection ratingCollection = RatingCollection(ratings);
    DishCollection dishDB = DishCollection(dishes);

    var favorites = ratingCollection.getSingularUserRatings(currentUserEmail);
    favorites.sort((a, b) => a.starRating.compareTo(b.starRating));
    favorites = favorites.toList();
    favorites = (favorites.length <= 8) ? favorites : favorites.sublist(0, 8);
    int favoriteImagesIndex = 0;

    String? getImage() {
      return favoriteImagesIndex < favorites.length
          ? favorites[favoriteImagesIndex++].picture
          : 'assets/images/logo_dark.png';
    }

    Widget getTile() {
      return Tile(
          index: favoriteImagesIndex,
          image: favoriteImagesIndex < favorites.length
              ? favorites[favoriteImagesIndex].picture!
              : 'assets/images/logo_dark.png',
          dishName: favoriteImagesIndex < favorites.length
              ? dishDB.getDishName(favorites[favoriteImagesIndex++].dishID)
              : '');
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: getTile(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: getTile(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: getTile(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: getTile(),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: getTile(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: getTile(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: getTile(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: getTile(),
            ),
          ],
        ),
      ],
    );
  }
}
