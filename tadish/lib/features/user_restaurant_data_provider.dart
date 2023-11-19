import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tadish/features/picker/data/restaurant_provider.dart';
import 'package:tadish/features/picker/domain/restaurant.dart';

import 'user/domain/user.dart';
import 'picker/data/restaurant_provider.dart';
import 'picker/domain/restaurant.dart';
import 'user/data/user_providers.dart';

part 'user_restaurant_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class UserRestaurant {
  UserRestaurant(
      {required this.restaurant,
      required this.user,
      required this.currentUserID});
  
  final List<Restaurant> restaurant;
  final List<User> user;
  final String currentUserID;
}

@riverpod
Future<UserRestaurant> userRestaurant(UserRestaurantRef ref) async {
  final restaurant = ref.watch(restaurantsProvider.future);
  final user = ref.watch(usersProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return UserRestaurant(
      restaurant: await restaurant,
      user: await user,
      currentUserID: currentUserID);
}
