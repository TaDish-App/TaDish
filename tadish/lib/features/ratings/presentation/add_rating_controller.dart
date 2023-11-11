import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/rating_database.dart';
import '../data/rating_provider.dart';
import '../domain/rating.dart';

part 'add_rating_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class AddRatingController extends _$AddRatingController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new rating or edit an existing one.
  Future<void> addRating({
    required Rating rating,
    required String dishName,
    required VoidCallback onSuccess,
    required String restaurantName,
  }) async {
    state = const AsyncLoading();
    RatingDatabase ratingDatabase = ref.watch(ratingDatabaseProvider);

    final newState =
        await AsyncValue.guard(() => ratingDatabase.setRating(rating));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteRating({
    required Rating rating,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    RatingDatabase ratingDatabase = ref.watch(ratingDatabaseProvider);
    final newState =
        await AsyncValue.guard(() => ratingDatabase.deleteRating(rating));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
