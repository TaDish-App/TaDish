import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadish/data_model/dish_db.dart';

/// The data associated with users.
class RatingData {
  RatingData(
      {required this.id,
      required this.raterID,
      required this.dishID,
      required this.starRating,
      this.sweetness,
      this.sourness,
      this.saltiness,
      this.spiciness,
      List<String>? tags,
      String? picture,
      String? publicNote,
      String? privateNote,
      required this.createdOn})
      : picture = picture ?? '',
        publicNote = publicNote ?? '',
        privateNote = privateNote ?? '',
        tags = tags ?? [];

  String id;
  String raterID;
  String dishID;
  double starRating;
  double? sweetness;
  double? sourness;
  double? saltiness;
  double? spiciness;
  List<String> tags;
  String picture;
  String publicNote;
  String privateNote;
  DateTime createdOn;
}

/// Provides access to and operations on all defined users.
class RatingsDB {
  RatingsDB(this.ref);

  final ProviderRef<RatingsDB> ref;

  final List<RatingData> _ratings = [
    RatingData(
        id: 'rating-001',
        raterID: 'user-001',
        dishID: 'dish-001',
        starRating: 3.5,
        sweetness: 80.0,
        sourness: 0.0,
        saltiness: 10.0,
        spiciness: 0,
        tags: ['local'],
        picture: 'assets/images/1.jpg',
        publicNote: 'taste very sweet',
        privateNote: 'better than the one from Costco',
        createdOn: DateTime.parse('2023-07-20 20:18:04Z')),
    RatingData(
      id: 'rating-002',
      raterID: 'user-002',
      dishID: 'dish-001',
      starRating: 2,
      sweetness: 100.0,
      sourness: 0.0,
      saltiness: 30.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/1.jpg',
      publicNote: 'my tongue literally fell off it was so sweet',
      privateNote: 'never eat again',
      createdOn: DateTime.parse('2023-01-05 05:29:04Z'),
    ),
    RatingData(
      id: 'rating-003',
      raterID: 'user-003',
      dishID: 'dish-002',
      starRating: 4,
      sweetness: 70,
      sourness: 10.0,
      saltiness: 10.0,
      spiciness: 0.0,
      tags: ['vegan'],
      picture: 'assets/images/2.jpg',
      publicNote: 'Amazing that it is vegan!',
      privateNote: 'give to boyfriend',
      createdOn: DateTime.parse('2023-12-23 12:22:04Z'),
    ),
    RatingData(
      id: 'rating-004',
      raterID: 'user-004',
      dishID: 'dish-003',
      starRating: 5,
      sweetness: 80.0,
      sourness: 0.0,
      saltiness: 20.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/3.jpg',
      publicNote:
          'The raspberry practically melted in my mouth with deliciousness. So good that my girlfriend barely left me half.',
      privateNote: 'buy at least 1 a year',
      createdOn: DateTime.parse('2023-09-23 01:58:04Z'),
    ),
    RatingData(
      id: 'rating-005',
      raterID: 'user-004',
      dishID: 'dish-004',
      starRating: 4,
      sweetness: 60.0,
      sourness: 0.0,
      saltiness: 20.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/4.jpg',
      publicNote: 'Wish I brought more lactose pills to eat it',
      privateNote: '',
      createdOn: DateTime.parse('2023-03-05 01:58:04Z'),
    ),
    RatingData(
      id: 'rating-006',
      raterID: 'user-001',
      dishID: 'dish-005',
      starRating: 1,
      sweetness: 88.0,
      sourness: 51.0,
      saltiness: 12.0,
      spiciness: 30,
      tags: ['local'],
      picture: 'assets/images/5.jpg',
      publicNote: 'what was this',
      privateNote: '',
      createdOn: DateTime.parse('2023-02-14 01:58:04Z'),
    ),
    RatingData(
      id: 'rating-007',
      raterID: 'user-001',
      dishID: 'dish-004',
      starRating: 1,
      sweetness: 100.0,
      sourness: 68.0,
      saltiness: 32.0,
      spiciness: 10,
      tags: ['local'],
      picture: 'assets/images/4.jpg',
      publicNote: 'never again',
      privateNote: '',
      createdOn: DateTime.parse('2023-02-14 01:58:04Z'),
    ),
    RatingData(
      id: 'rating-008',
      raterID: 'user-001',
      dishID: 'dish-003',
      starRating: 5,
      sweetness: 80.0,
      sourness: 0.0,
      saltiness: 20.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/3.jpg',
      publicNote: 'So delicious. You will not regret',
      privateNote: 'yumz',
      createdOn: DateTime.parse('2023-08-23 01:58:04Z'),
    ),
    RatingData(
      id: 'rating-009',
      raterID: 'user-002',
      dishID: 'dish-003',
      starRating: 5,
      sweetness: 80.0,
      sourness: 0.0,
      saltiness: 20.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/3.jpg',
      publicNote: 'Wish I could eat more than 10 at once',
      privateNote: 'yumz',
      createdOn: DateTime.parse('2023-04-13 11:49:04Z'),
    ),
    RatingData(
      id: 'rating-010',
      raterID: 'user-001',
      dishID: 'dish-002',
      starRating: 5,
      sweetness: 80.0,
      sourness: 0.0,
      saltiness: 20.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/2.jpg',
      publicNote: 'Wish I could eat more than 10 at once',
      privateNote: 'yumz',
      createdOn: DateTime.parse('2023-04-13 11:49:04Z'),
    ),
    RatingData(
      id: 'rating-011',
      raterID: 'user-001',
      dishID: 'dish-003',
      starRating: 5,
      sweetness: 80.0,
      sourness: 0.0,
      saltiness: 20.0,
      spiciness: 0,
      tags: ['local'],
      picture: 'assets/images/3.jpg',
      publicNote: 'Wish I could eat more than 10 at once',
      privateNote: 'yumz',
      createdOn: DateTime.parse('2023-04-13 11:49:04Z'),
    ),
  ];

  List<String> getRatingsIDs() {
    return _ratings.map((data) => data.id).toList();
  }

  RatingData getRating(String ratingID) {
    return _ratings.singleWhere((data) => data.id == ratingID);
  }

  List<RatingData> getRatingsOfDish(dishID) {
    return _ratings.where((data) => data.dishID == dishID).toList();
  }

  List<RatingData> getSingularUserRatings(userID) {
    return _ratings.where((data) => data.raterID == userID).toList();
  }

  void addRating({
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
    String? privateNote,}) {

    // id
    String id = 'rating-${(_ratings.length + 1).toString().padLeft(3, '0')}';

    // dishID - create new dish if it's a new dish
    DishDB dishesDB = ref.read(dishDBProvider);
    String dishID = 'dish-001';
    // if (dishesDB.checkDishExists(name)) {
    //   // grab dish id
    //   dishesDB.getDishID(name); // TODO This is bad because name may not be unique
    // } else {
    //   // create new dish entity
    //   dishID  = 'dish-${(dishesDB.getSize() + 1).toString().padLeft(3, '0')}';
    // }

    // created On
    DateTime createdOn = DateTime.now();

    RatingData data = RatingData(
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
  }
}

/// The singleton instance providing access to all user data for clients.
final ratingsDBProvider = Provider<RatingsDB>((ref) {
  return RatingsDB(ref);
});
