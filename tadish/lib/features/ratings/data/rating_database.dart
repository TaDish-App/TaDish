import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/rating.dart';

/// Provides access to the Firestore database storing [Rating] documents.
class RatingDatabase {
  RatingDatabase(this.ref);

  final ProviderRef<RatingDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Rating>> watchRatings() => _service.watchCollection(
      path: FirestorePath.ratings(),
      builder: (data, documentId) => Rating.fromJson(data!));

  Stream<Rating> watchRating(String ratingId) => _service.watchDocument(
      path: FirestorePath.rating(ratingId),
      builder: (data, documentId) => Rating.fromJson(data!));

  Future<List<Rating>> fetchRatings() => _service.fetchCollection(
      path: FirestorePath.ratings(),
      builder: (data, documentId) => Rating.fromJson(data!));

  Future<Rating> fetchRating(String ratingId) => _service.fetchDocument(
      path: FirestorePath.rating(ratingId),
      builder: (data, documentId) => Rating.fromJson(data!));

  Future<void> setRating(Rating rating) => _service.setData(
      path: FirestorePath.rating(rating.id), data: rating.toJson());

  Future<void> setRatingDelayed(Rating rating) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.rating(rating.id), data: rating.toJson()));

  Future<void> setRatingError(Rating rating) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteRating(Rating rating) =>
      _service.deleteData(path: FirestorePath.rating(rating.id));
}