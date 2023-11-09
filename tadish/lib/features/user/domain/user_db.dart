import 'dart:ui';
import '../../../../../custom_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserData {
  UserData(
      {required this.id,
        required this.name,
        required this.username,
        required this.email,
        List<double>? tastePreference,
        List<String>? friendsIDList,
        List<String>? savedDishesID,
        int? taggedDishes,
        this.geolocation,
        required this.role,
        String? gender,
        this.age,
        this.ethnicity,
        DateTime? createdOn,
        DateTime? updatedOn,
        this.isActive = true})
      : tastePreference = tastePreference ?? [],
        friendsIDList = friendsIDList ?? [],
        savedDishesID = savedDishesID ?? [],
        gender = gender ?? "Prefer not to respond",
        createdOn = createdOn ?? DateTime.now(),
        taggedDishes = taggedDishes ?? 0,
        updatedOn = updatedOn ?? DateTime.now();

    String id;
    String name;
    String username;
    String email;
    List<double> tastePreference;
    List<String> friendsIDList;
    List<String> savedDishesID;
    String? geolocation;
    String role;
    String gender;
    int? age;
    String? ethnicity;
    DateTime createdOn;
    DateTime updatedOn;
    bool isActive;
    int taggedDishes;

}

class UserDB {
  UserDB(this.ref);

  final ProviderRef<UserDB> ref;

  final List<UserData> _users = [
    UserData(
      id : 'user-000',
      name : 'Admin Foo',
      username : 'admin_foo',
      email : 'admin@foo.com',
      tastePreference : [0.90, 0.70, 0.60, 0.55],
      friendsIDList : ['user-002', 'user-002', 'user-003', 'user-004'],
      savedDishesID : ['dish-001', 'dish-002', 'dish-003', 'dish-004', 'dish-005'],
      geolocation : 'Honolulu, HI',
      role : 'admin',
      gender : 'Prefer not to respond',
      age : 100,
      ethnicity : 'Prefer not to respond',
      taggedDishes : 10,
    ),
    UserData(
        id : 'user-001',
        name : 'Timothy Huo',
        username : 'thuo',
        email : 'thuo@gmail.com',
        tastePreference : [0.10, 0.0, 0.6, 0.3],
        friendsIDList : ['user-002', 'user-003'],
        savedDishesID : ['dish-001', 'dish-002', 'dish-005'],
        geolocation : 'Honolulu, HI',
        role : 'user',
        gender : 'M',
        age : 21,
        ethnicity : 'Asian',
        taggedDishes : 14,
    ),
    UserData(
      id : 'user-002',
      name : 'Alyssia Chen',
      username : 'abc8',
      email : 'abc8@gmail.com',
      tastePreference : [0.30, .50, 0.3, 0.8],
      friendsIDList : ['user-001', 'user-003'],
      savedDishesID : ['dish-004', 'dish-005'],
      geolocation : 'Honolulu, HI',
      role : 'user',
      gender : 'F',
      age : 21,
      ethnicity : 'Asian',
      taggedDishes : 12,
    ),
    UserData(
      id : 'user-003',
      name : 'John Foo',
      username : 'john_foo',
      email : 'john@foo.com',
      tastePreference : [0.80, .50, 0.70, 0.8],
      friendsIDList : ['user-001', 'user-002'],
      savedDishesID : ['dish-002', 'dish-003', 'dish-005'],
      geolocation : 'Seattle, WA',
      role : 'user',
      gender : 'M',
      age : 24,
      ethnicity : 'Black or African American,',
      taggedDishes : 6,
    ),
    UserData(
      id : 'user-004',
      name : 'Jill Foo',
      username : 'fill_foo',
      email : 'jill@foo.con',
      tastePreference : [0.65, .44, 0.70, 0.98],
      friendsIDList : ['user-003'],
      savedDishesID : ['dish-003', 'dish-004', 'dish-005'],
      geolocation : 'San Francisco, CA',
      role : 'user',
      gender : 'F',
      age : 19,
      ethnicity : 'White',
      taggedDishes : 5,
    ),
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  List<UserData> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }

  List<UserData> getFriends(String userID) {
    List<String> friends = _users.singleWhere((user) => user.id == userID).friendsIDList;
    return _users.where((userData) => friends.contains(userData.id)).toList();
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

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

final currentUserIDProvider = StateProvider<String>((ref) {
  return 'user-001';
});