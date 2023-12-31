import 'rating.dart';

/// Encapsulates operations on the list of [Rating] returned from Firestore.
class RatingCollection {
  RatingCollection(ratings) : _ratings = ratings;

  final List<Rating> _ratings;

  List<String> getRatingsIDs() {
    return _ratings.map((data) => data.id).toList();
  }

  int size() {
    return _ratings.length;
  }

  Rating getRating(String ratingID) {
    return _ratings.singleWhere((data) => data.id == ratingID);
  }

  List<Rating> getRatingsOfDish(dishID) {
    return _ratings.where((data) => data.dishID == dishID).toList();
  }

  List<Rating> getSingularUserRatings(userEmail) {
    // Filter ratings for the specified user
    List<Rating> userRatings = _ratings.where((data) => data.raterEmail == userEmail).toList();

    // Sort the copy in reverse chronological order based on the 'createdOn' field
    userRatings.sort((a, b) => b.createdOn.compareTo(a.createdOn));

    return userRatings;
  }

  /* void addRating({
    required name,
    required raterID,
    required starRating,
    required sweetness,
    required sourness,
    required saltiness,
    required spiciness,
    required List<String>? tags,
    required String? picture,
    String? publicNote,
    String? privateNote,
  }) {
    // id
    String id = 'rating-${(_ratings.length + 1).toString().padLeft(3, '0')}';

    // dishID - create new dish if it's a new dish
    // DishDB dishesDB = ref.read(dishDBProvider);
    String dishID = 'dish-001';
    // if (dishesDB.checkDishExists(name)) {
    //   // grab dish id
    //   dishesDB.getDishID(name); // TODO This is bad because name may not be unique
    // } else {
    //   // create new dish entity
    //   dishID  = 'dish-${(dishesDB.getSize() + 1).toString().padLeft(3, '0')}';
    // }

    // created On
    String createdOn = DateTime.now().toString();

    Rating data = Rating(
        id: id,
        dishID: dishID,
        raterID: raterID,
        starRating: starRating,
        sweetness: sweetness,
        sourness: sourness,
        saltiness: saltiness,
        spiciness: spiciness,
        tags: tags,
        picture: picture,
        publicNote: publicNote,
        privateNote: privateNote,
        createdOn: createdOn);
    _ratings.add(data);
  } */

  /* void editRating({
    required ratingID,
    required dishID,
    required name,
    required raterID,
    required starRating,
    required sweetness,
    required sourness,
    required saltiness,
    required spiciness,
    required List<String>? tags,
    required String? picture,
    String? publicNote,
    String? privateNote,
    required String createdOn,
  }) {
    Rating data = Rating(
        id: ratingID,
        dishID: dishID,
        raterID: raterID,
        starRating: starRating,
        sweetness: sweetness,
        sourness: sourness,
        saltiness: saltiness,
        spiciness: spiciness,
        tags: tags,
        picture: picture,
        publicNote: publicNote,
        privateNote: privateNote,
        createdOn: createdOn);

    _ratings.removeWhere((ratingData) => ratingData.id == ratingID);

    _ratings.add(data);
  } */
}
