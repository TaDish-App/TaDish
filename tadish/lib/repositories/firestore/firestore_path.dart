/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String restaurant(String restaurantID) => 'restaurants/$restaurantID';
  static String restaurants() => 'restaurants';

  static String rating(String ratingID) => 'ratings/$ratingID';
  static String ratings() => 'ratings';

  static String dish(String dishID) => 'dishes/$dishID';
  static String dishes() => 'dishes';

  static String user(String userID) => 'users/$userID';
  static String users() => 'users';
}