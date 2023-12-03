import 'package:flutter/material.dart';
import 'package:tadish/features/user/domain/user_collection.dart';
import 'package:tadish/features/user/presentation/favorites_view.dart';
import 'package:tadish/features/ratings/domain/rating.dart';
import '../../ratings/data/rating_provider.dart';
import '../../common/drawer_view.dart';
import '../../ratings/domain/rating_collection.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import 'history_view.dart';
import '../../common/taste_prefs_radar_chart.dart';
import '../../../custom_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dish_rating_user_data_provider.dart';
import '../domain/user.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';

class OtherProfileView extends ConsumerStatefulWidget {
  static const routeName = '/other_profile';
  final String email;
  const OtherProfileView({
    required this.email,
    super.key,
  });

  @override
  ConsumerState<OtherProfileView> createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends ConsumerState<OtherProfileView> {
  bool onFavorites = true;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<DishRatingUser> asyncDishRatingUser = ref.watch(dishRatingUserProvider);

    return asyncDishRatingUser.when(
        data: (dishRatingUser) => _build(
            context: context,
            ratings: dishRatingUser.ratings,
            users: dishRatingUser.users,
            currentUserEmail: widget.email,
            ref: ref),
        loading: () => const TadishLoading(),
        error: (error, stacktrace) =>
            TadishError(error.toString(), stacktrace.toString()));
  }

  Widget _build({required BuildContext context,
    required List<Rating> ratings,
    required List<User> users,
    required String currentUserEmail,
    required WidgetRef ref}) {
    RatingCollection ratingCollection = RatingCollection(ratings);
    const secondaryTextColor = Colors.grey;
    final UserCollection userDB = UserCollection(users);
    final User currentUser = userDB.getUser(currentUserEmail);

    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // Radar Chart for taste prefs
            TastePrefsRadarChart(
              tastePrefsData: currentUser.tastePreference,
              radius: 40,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              currentUser.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, color: secondaryTextColor),
                Text("${currentUser.username}  | ",
                    style: const TextStyle(color: secondaryTextColor)),
                const Icon(
                  Icons.pin_drop_rounded,
                  color: secondaryTextColor,
                ),
                Text(" ${currentUser.geolocation}",
                    style: const TextStyle(color: secondaryTextColor)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                        ratingCollection
                            .getSingularUserRatings(currentUserEmail)
                            .length
                            .toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Ratings",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text(userDB.getFriends(currentUserEmail).length.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Friends",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                ),
                Column(
                  children: [
                    Text(userDB.getUser(currentUserEmail).taggedDishes.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    const Text("Special",
                        style: TextStyle(color: secondaryTextColor)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: onFavorites
                              ? customPrimarySwatch.withOpacity(0.15)
                              : Colors.transparent),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (!onFavorites) {
                        setState(() {
                          onFavorites = !onFavorites;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Icon(Icons.favorite,
                        color: onFavorites
                            ? customPrimarySwatch.withOpacity(0.9)
                            : customPrimarySwatch.withOpacity(0.5)),
                  ),
                )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: !onFavorites
                                ? customPrimarySwatch.withOpacity(0.15)
                                : Colors.transparent),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (onFavorites) {
                          setState(() {
                            onFavorites = !onFavorites;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Icon(Icons.history_edu,
                          color: !onFavorites
                              ? customPrimarySwatch.withOpacity(0.9)
                              : customPrimarySwatch.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            ),
            (onFavorites
                ? Expanded(
                    child: FavoritesView(userID: currentUserEmail)
                  )
                : Expanded(child: HistoryView(userID: currentUserEmail))),
          ],
        ),
      ),
    )
    );
  }
}
