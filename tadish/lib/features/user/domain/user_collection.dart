import 'user.dart';

/// Encapsulates operations on the list of [User] returned from Firestore.
class UserCollection {
  UserCollection(users) : _users = users;

  final List<User> _users;

  int size() {
    return _users.length;
  }

  User getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  List<User> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }

  List<User> getFriends(String userID) {
    List<String>? friends = _users.singleWhere((user) => user.id == userID).friendsIDList;
    if (friends != null) {
      return _users.where((userData) => friends.contains(userData.id)).toList();
    }
    return [];
  }

  bool isUserEmail(String email) {
    List<String> emails = _users.map((userData) => userData.email).toList();
    return emails.contains(email);
  }

  String getUserID(String emailOrUsername) {
    return (emailOrUsername.startsWith('@'))
        ? _users
        .firstWhere((userData) => userData.username == emailOrUsername)
        .id
        : _users.firstWhere((userData) => userData.email == emailOrUsername).id;
  }

  List<String> getAllEmails() {
    return _users.map((userData) => userData.email).toList();
  }
}
