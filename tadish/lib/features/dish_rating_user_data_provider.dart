import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'review/data/dish_provider.dart';
import 'review/domain/dish.dart';
import 'ratings/data/rating_provider.dart';
import 'ratings/domain/rating.dart';
import 'user/data/user_providers.dart';
import 'user/domain/user.dart';

part 'dish_rating_user_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class DishRatingUser {
  DishRatingUser(
      {required this.dishes,
      required this.ratings,
      required this.users,
      required this.currentUserID});

  final List<Dish> dishes;
  final List<Rating> ratings;
  final List<User> users;
  final String currentUserID;
}

@riverpod
Future<DishRatingUser> dishRatingUser(DishRatingUserRef ref) async {
  final dishes = ref.watch(dishesProvider.future);
  final ratings = ref.watch(ratingsProvider.future);
  final users = ref.watch(usersProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return DishRatingUser(
      dishes: await dishes,
      ratings: await ratings,
      users: await users,
      currentUserID: currentUserID);
}
