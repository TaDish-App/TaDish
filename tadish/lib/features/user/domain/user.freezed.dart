// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  List<double>? get tastePreference => throw _privateConstructorUsedError;
  List<String>? get friendsIDList => throw _privateConstructorUsedError;
  List<String>? get savedDishesID => throw _privateConstructorUsedError;
  int? get taggedDishes => throw _privateConstructorUsedError;
  String? get geolocation => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get ethnicity => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;
  DateTime? get updatedOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String name,
      String username,
      String email,
      List<double>? tastePreference,
      List<String>? friendsIDList,
      List<String>? savedDishesID,
      int? taggedDishes,
      String? geolocation,
      String role,
      String gender,
      int? age,
      String? ethnicity,
      DateTime? createdOn,
      DateTime? updatedOn});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? tastePreference = freezed,
    Object? friendsIDList = freezed,
    Object? savedDishesID = freezed,
    Object? taggedDishes = freezed,
    Object? geolocation = freezed,
    Object? role = null,
    Object? gender = null,
    Object? age = freezed,
    Object? ethnicity = freezed,
    Object? createdOn = freezed,
    Object? updatedOn = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      tastePreference: freezed == tastePreference
          ? _value.tastePreference
          : tastePreference // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      friendsIDList: freezed == friendsIDList
          ? _value.friendsIDList
          : friendsIDList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      savedDishesID: freezed == savedDishesID
          ? _value.savedDishesID
          : savedDishesID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      taggedDishes: freezed == taggedDishes
          ? _value.taggedDishes
          : taggedDishes // ignore: cast_nullable_to_non_nullable
              as int?,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      ethnicity: freezed == ethnicity
          ? _value.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String username,
      String email,
      List<double>? tastePreference,
      List<String>? friendsIDList,
      List<String>? savedDishesID,
      int? taggedDishes,
      String? geolocation,
      String role,
      String gender,
      int? age,
      String? ethnicity,
      DateTime? createdOn,
      DateTime? updatedOn});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? tastePreference = freezed,
    Object? friendsIDList = freezed,
    Object? savedDishesID = freezed,
    Object? taggedDishes = freezed,
    Object? geolocation = freezed,
    Object? role = null,
    Object? gender = null,
    Object? age = freezed,
    Object? ethnicity = freezed,
    Object? createdOn = freezed,
    Object? updatedOn = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      tastePreference: freezed == tastePreference
          ? _value._tastePreference
          : tastePreference // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      friendsIDList: freezed == friendsIDList
          ? _value._friendsIDList
          : friendsIDList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      savedDishesID: freezed == savedDishesID
          ? _value._savedDishesID
          : savedDishesID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      taggedDishes: freezed == taggedDishes
          ? _value.taggedDishes
          : taggedDishes // ignore: cast_nullable_to_non_nullable
              as int?,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      ethnicity: freezed == ethnicity
          ? _value.ethnicity
          : ethnicity // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedOn: freezed == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      final List<double>? tastePreference,
      final List<String>? friendsIDList,
      final List<String>? savedDishesID,
      this.taggedDishes,
      this.geolocation,
      required this.role,
      required this.gender,
      this.age,
      this.ethnicity,
      this.createdOn,
      this.updatedOn})
      : _tastePreference = tastePreference,
        _friendsIDList = friendsIDList,
        _savedDishesID = savedDishesID,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  final List<double>? _tastePreference;
  @override
  List<double>? get tastePreference {
    final value = _tastePreference;
    if (value == null) return null;
    if (_tastePreference is EqualUnmodifiableListView) return _tastePreference;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _friendsIDList;
  @override
  List<String>? get friendsIDList {
    final value = _friendsIDList;
    if (value == null) return null;
    if (_friendsIDList is EqualUnmodifiableListView) return _friendsIDList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _savedDishesID;
  @override
  List<String>? get savedDishesID {
    final value = _savedDishesID;
    if (value == null) return null;
    if (_savedDishesID is EqualUnmodifiableListView) return _savedDishesID;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? taggedDishes;
  @override
  final String? geolocation;
  @override
  final String role;
  @override
  final String gender;
  @override
  final int? age;
  @override
  final String? ethnicity;
  @override
  final DateTime? createdOn;
  @override
  final DateTime? updatedOn;

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, email: $email, tastePreference: $tastePreference, friendsIDList: $friendsIDList, savedDishesID: $savedDishesID, taggedDishes: $taggedDishes, geolocation: $geolocation, role: $role, gender: $gender, age: $age, ethnicity: $ethnicity, createdOn: $createdOn, updatedOn: $updatedOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._tastePreference, _tastePreference) &&
            const DeepCollectionEquality()
                .equals(other._friendsIDList, _friendsIDList) &&
            const DeepCollectionEquality()
                .equals(other._savedDishesID, _savedDishesID) &&
            (identical(other.taggedDishes, taggedDishes) ||
                other.taggedDishes == taggedDishes) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.ethnicity, ethnicity) ||
                other.ethnicity == ethnicity) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      username,
      email,
      const DeepCollectionEquality().hash(_tastePreference),
      const DeepCollectionEquality().hash(_friendsIDList),
      const DeepCollectionEquality().hash(_savedDishesID),
      taggedDishes,
      geolocation,
      role,
      gender,
      age,
      ethnicity,
      createdOn,
      updatedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final String name,
      required final String username,
      required final String email,
      final List<double>? tastePreference,
      final List<String>? friendsIDList,
      final List<String>? savedDishesID,
      final int? taggedDishes,
      final String? geolocation,
      required final String role,
      required final String gender,
      final int? age,
      final String? ethnicity,
      final DateTime? createdOn,
      final DateTime? updatedOn}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get email;
  @override
  List<double>? get tastePreference;
  @override
  List<String>? get friendsIDList;
  @override
  List<String>? get savedDishesID;
  @override
  int? get taggedDishes;
  @override
  String? get geolocation;
  @override
  String get role;
  @override
  String get gender;
  @override
  int? get age;
  @override
  String? get ethnicity;
  @override
  DateTime? get createdOn;
  @override
  DateTime? get updatedOn;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
