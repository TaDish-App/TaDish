import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'user/domain/user.dart';
import 'user/data/user_providers.dart';

part 'user_all_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class UserAll {
  UserAll(
      {
      required this.user,
      required this.currentUserID});
  
  final List<User> user;
  final String currentUserID;
}

@riverpod
Future<UserAll> userAll(UserAllRef ref) async {
  final user = ref.watch(usersProvider.future);
  final currentUserEmail = ref.watch(currentUserEmailProvider);
  return UserAll(
      user: await user,
      currentUserID: currentUserEmail);
}
