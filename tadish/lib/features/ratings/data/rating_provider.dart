import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/rating.dart';
import 'rating_database.dart';

part 'rating_provider.g.dart';

@riverpod
RatingDatabase ratingDatabase(RatingDatabaseRef ref) {
  return RatingDatabase(ref);
}

@riverpod
Stream<List<Rating>> ratings(RatingsRef ref) {
  final database = ref.watch(ratingDatabaseProvider);
  return database.watchRatings();
}