import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tadish/data_model/dish_db.dart';
import 'package:tadish/data_model/rating_db.dart';
import 'package:tadish/data_model/user_db.dart';
import '../../../components/Tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingsDB = ref.watch(ratingsDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);

    var favorites = ratingsDB.getSingularUserRatings(currentUserID);
    favorites.sort((a, b) => a.starRating.compareTo(b.starRating));
    favorites = favorites.toList();
    favorites = (favorites.length <= 8) ? favorites : favorites.sublist(0, 8);
    int favoriteImagesIndex = 0;

    String getImage() {
      return favoriteImagesIndex < favorites.length
          ? favorites[favoriteImagesIndex++].picture
          : 'assets/images/cloche_dark.png';
    }

    Widget getTile() {
      return Tile(
          index: favoriteImagesIndex,
          image: favoriteImagesIndex < favorites.length
              ? favorites[favoriteImagesIndex].picture
              : 'assets/images/cloche_dark.png',
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
