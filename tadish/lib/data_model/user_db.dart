class UserData {
  UserData(
      {required this.id,
        required this.name,
        required this.username,
        required this.email,
        List<double>? tastePreference,
        List<String>? friendsIDList,
        List<String>? savedDishesID,
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

}

class UserDB {
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
    ),
    UserData(
        id : 'user-001',
        name : 'Timothy Huo',
        username : 'thuo_hawaii',
        email : 'thuo_hawaii@gmail.com',
        tastePreference : [0.10, 0.0, 0.6, 0.3],
        friendsIDList : ['user-002', 'user-003'],
        savedDishesID : ['dish-001', 'dish-002', 'dish-005'],
        geolocation : 'Honolulu, HI',
        role : 'user',
        gender : 'M',
        age : 21,
        ethnicity : 'Asian',
    ),
    UserData(
      id : 'user-002',
      name : 'Alyssia Chen',
      username : 'alyssia_hawaii',
      email : 'alyssia_hawaii@gmail.com',
      tastePreference : [0.30, .50, 0.3, 0.8],
      friendsIDList : ['user-001', 'user-003'],
      savedDishesID : ['dish-004', 'dish-005'],
      geolocation : 'Honolulu, HI',
      role : 'user',
      gender : 'F',
      age : 21,
      ethnicity : 'Asian',
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

}

UserDB dishDB = UserDB();

/// The currently logged in user.
String currentUserID = 'user-001';