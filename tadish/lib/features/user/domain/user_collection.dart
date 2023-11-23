import 'user.dart';

/// Encapsulates operations on the list of [User] returned from Firestore.
class UserCollection {
  UserCollection(users) : _users = users;

  final List<User> _users;

  int size() {
    return _users.length;
  }

  User getUser(String userID) {
    return _users.firstWhere((userData) => userData.email == userID);
  }

  bool areUserNames(List<String> userNames) {
    List<String> allUserNames =
        _users.map((userData) => userData.username).toList();
    return userNames.every((userName) => allUserNames.contains(userName));
  }

  String getUserID(String emailOrUsername) {
    return (emailOrUsername.contains('@'))
        ? _users.firstWhere((user) => user.email == emailOrUsername).id
        : _users.firstWhere((user) => user.id == emailOrUsername).id;
  }

  bool isUserEmail(String email) {
    List<String> emails = _users.map((user) => user.email).toList();
    return emails.contains(email);
  }

  List<User> getUsers(List<String> userIDs) {
    return _users.where((user) => userIDs.contains(user.id)).toList();
  }

  List<String> getAllEmails() {
    return _users.map((user) => user.email).toList();
  }
  List<User> getFriends(String userID) {
    List<String> friends = _users.singleWhere((user) => user.email == userID).friendsIDList;
    return _users.where((userData) => friends.contains(userData.email)).toList();
  }
}


// UserData getUser(String userID) {
//     return _users.firstWhere((userData) => userData.id == userID);
//   }
//
//   List<UserData> getUsers(List<String> userIDs) {
//     return _users.where((userData) => userIDs.contains(userData.id)).toList();
//   }
//
//   List<UserData> getFriends(String userID) {
//     List<String> friends = _users.singleWhere((user) => user.id == userID).friendsIDList;
//     return _users.where((userData) => friends.contains(userData.id)).toList();
//   }
//
//   bool isUserEmail(String email) {
//     List<String> emails = _users.map((userData) => userData.email).toList();
//     return emails.contains(email);
//   }
//
//   String getUserID(String emailOrUsername) {
//     return (emailOrUsername.startsWith('@'))
//         ? _users
//         .firstWhere((userData) => userData.username == emailOrUsername)
//         .id
//         : _users.firstWhere((userData) => userData.email == emailOrUsername).id;
//   }
//
//   List<String> getAllEmails() {
//     return _users.map((userData) => userData.email).toList();
//   }
