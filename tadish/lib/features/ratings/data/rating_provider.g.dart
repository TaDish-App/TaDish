// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ratingDatabaseHash() => r'ffb1864d52551a6558a1fe79a5789ded46fa43cf';

/// See also [ratingDatabase].
@ProviderFor(ratingDatabase)
final ratingDatabaseProvider = AutoDisposeProvider<RatingDatabase>.internal(
  ratingDatabase,
  name: r'ratingDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RatingDatabaseRef = AutoDisposeProviderRef<RatingDatabase>;
String _$ratingsHash() => r'621822c005c544d6a8b4986173c3f37772653c14';

/// See also [ratings].
@ProviderFor(ratings)
final ratingsProvider = AutoDisposeStreamProvider<List<Rating>>.internal(
  ratings,
  name: r'ratingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ratingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RatingsRef = AutoDisposeStreamProviderRef<List<Rating>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
