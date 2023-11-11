// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restaurantDatabaseHash() =>
    r'cc2776fc2fcaad359680ca24a5503486559cc749';

/// See also [restaurantDatabase].
@ProviderFor(restaurantDatabase)
final restaurantDatabaseProvider =
    AutoDisposeProvider<RestaurantDatabase>.internal(
  restaurantDatabase,
  name: r'restaurantDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$restaurantDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RestaurantDatabaseRef = AutoDisposeProviderRef<RestaurantDatabase>;
String _$restaurantsHash() => r'ccf2e94841c8847972d0268c4d7ff73f0b669d15';

/// See also [restaurants].
@ProviderFor(restaurants)
final restaurantsProvider =
    AutoDisposeStreamProvider<List<Restaurant>>.internal(
  restaurants,
  name: r'restaurantsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$restaurantsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RestaurantsRef = AutoDisposeStreamProviderRef<List<Restaurant>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
