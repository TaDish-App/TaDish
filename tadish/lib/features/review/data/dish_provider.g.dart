// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dishDatabaseHash() => r'7844e4e5d6e3ac75151572796883c828c5f86a5a';

/// See also [dishDatabase].
@ProviderFor(dishDatabase)
final dishDatabaseProvider = AutoDisposeProvider<DishDatabase>.internal(
  dishDatabase,
  name: r'dishDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dishDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DishDatabaseRef = AutoDisposeProviderRef<DishDatabase>;
String _$dishesHash() => r'2c579f789ad3ddd6c60c60c6fd72861de90b1e66';

/// See also [dishes].
@ProviderFor(dishes)
final dishesProvider = AutoDisposeStreamProvider<List<Dish>>.internal(
  dishes,
  name: r'dishesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dishesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DishesRef = AutoDisposeStreamProviderRef<List<Dish>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
