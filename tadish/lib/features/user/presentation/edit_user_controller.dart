import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/user_database.dart';
import '../data/user_providers.dart';
import '../domain/user.dart';

part 'edit_user_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditUserController extends _$EditUserController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new rating or edit an existing one.
  Future<void> updateUser({
    required User updatedUser,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    var userDatabase = ref.watch(userDatabaseProvider);
    var newState =
        await AsyncValue.guard(() => userDatabase.setUser(updatedUser));
    if (mounted) {
      state = newState;
    }

    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      UserDatabase userDatabase = ref.watch(userDatabaseProvider);
      final user = await AsyncValue.guard(
          () => userDatabase.fetchUser(updatedUser.email));

      newState =
          await AsyncValue.guard(() => userDatabase.setUser(updatedUser));
      onSuccess();
    }
  }
}
