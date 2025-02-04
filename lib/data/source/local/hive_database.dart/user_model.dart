import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String email;

  @HiveField(4)
  String password;

  @HiveField(5)
  int userType;
  @HiveField(6)
  List<Place> places;
  User({
    this.id = 0,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.userType,
    this.places = const [],
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      userType: json['userType'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'userType': userType,
    };
  }
}

@HiveType(typeId: 1)
class Place extends HiveObject {
  @HiveField(0)
  String placeName;

  @HiveField(1)
  double amount;

  @HiveField(2)
  int addedBy;

  @HiveField(3)
  int addedPersonUserType;

  Place(
      {required this.placeName,
      required this.amount,
      required this.addedBy,
      required this.addedPersonUserType});
}
