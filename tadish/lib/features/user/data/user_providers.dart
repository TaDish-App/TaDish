import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/user.dart';
import 'user_database.dart';

part 'user_providers.g.dart';

@riverpod
UserDatabase userDatabase(UserDatabaseRef ref) {
  return UserDatabase(ref);
}

@riverpod
Stream<List<User>> users(UsersRef ref) {
  final database = ref.watch(userDatabaseProvider);
  return database.watchUsers();
}

@riverpod
String currentUserEmail(CurrentUserEmailRef ref) {
  final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  return instance.currentUser!.email!;
}

@riverpod
Future<User> currentUser(CurrentUserRef ref) async {
  final String currentUserEmail = ref.watch(currentUserEmailProvider);
  final database = ref.watch(userDatabaseProvider);
  return await database.fetchUser(currentUserEmail);
}

// Old way:
// final userDatabaseProvider = Provider<UserDatabase>((ref) {
//   return UserDatabase(ref);
// });
//
// final usersProvider = StreamProvider<List<User>>((ref) {
//   final database = ref.watch(userDatabaseProvider);
//   return database.watchUsers();
// });
//
// final currentUserIDProvider = StateProvider<String>((ref) {
//   final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
//   return instance.currentUser!.email!;
// });
//
// final currentUserProvider = FutureProvider<User>((ref) async {
//   final String currentUserId = ref.watch(currentUserIDProvider);
//   final database = ref.watch(userDatabaseProvider);
//   return await database.fetchUser(currentUserId);
// });
