import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:hive/hive.dart';
import 'package:propswift/data/source/local/shared_pref/shared_preference.dart';

class HiveServices {
//   final userBox = await Hive.openBox<User>('users');
// final placeBox = await Hive.openBox<Place>('places');
  Box<User>? userBox;
  Box<Place>? placeBox;
  Future openUserHiveBox() async {
    userBox = await Hive.openBox<User>('users');
  }

  Future openPlaceHiveBox() async {
    placeBox = await Hive.openBox<Place>('places');
  }

  Future closeUserHiveBox() async {
    await userBox!.close();
  }

  Future closePlaceHiveBox() async {
    await placeBox!.close();
  }

  Future<void> addUser(User user) async {
    print("add user calling");
    await openUserHiveBox();
    if (userBox == null) {
      await openUserHiveBox();
      await addUser(user);
    } else {
      print("user box not null");
      user.id = userBox!.length + 1;
      await userBox!.add(user);
    }
  }

  Future<void> addPlaceToUser(int userId, Place place) async {
    await openUserHiveBox();
    await openPlaceHiveBox();

    if (userBox == null || placeBox == null) {
      await openUserHiveBox();
      await openPlaceHiveBox();
    }

    final user = userBox!.values.firstWhere((user) => user.id == userId);
    List<Place> updatedPlaces = List<Place>.from(user.places);
    updatedPlaces.add(place);
    user.places = updatedPlaces;
    await user.save();
    await placeBox!.add(place);
  }

  // Future<void> editPlace(int userId, int placeIndex, Place updatedPlace) async {
  //   await openUserHiveBox();
  //   await openPlaceHiveBox();
  //   if (userBox == null) {
  //     await openUserHiveBox();
  //   } else if (placeBox == null) {
  //     await openPlaceHiveBox();
  //   } else {
  //     final user = userBox!.values.firstWhere((user) => user.id == userId);
  //     user.places[placeIndex] = updatedPlace;

  //     await user.save();
  //   }
  // }

  Future<List<Place>> getPLaceList() async {
    await openPlaceHiveBox();

    if (placeBox == null) {
      await openPlaceHiveBox();
    }

    List<Place> allPlaces = placeBox!.values.toList();

    print("allplaces : $allPlaces");

    return allPlaces;
  }

  // Future<void> deletePlace(int userId, int placeIndex) async {
  //   await openUserHiveBox();
  //   await openPlaceHiveBox();
  //   if (userBox == null) {
  //     await openUserHiveBox();
  //     await deletePlace(userId, placeIndex);
  //   } else if (placeBox == null) {
  //     await openPlaceHiveBox();
  //   } else {
  //     final user = userBox!.values.firstWhere((user) => user.id == userId);      user.places.removeAt(placeIndex);
  //     await user.save();
  //   }
  // }
  Future<void> deletePlace(int userId, int placeIndex) async {
    await openUserHiveBox();
    await openPlaceHiveBox();
    print("Started deletion process");

    if (userBox == null || placeBox == null) {
      print("Hive boxes not opened");
      await openUserHiveBox();
      await openPlaceHiveBox();
    }

    print("Hive boxes opened");
    print("Attempting to delete at index: $placeIndex");

    if (placeIndex >= 0 && placeIndex < placeBox!.length) {
      await placeBox!.deleteAt(placeIndex);
      print("Deleted place at index: $placeIndex");
    } else {
      print("Invalid index, deletion failed");
    }
  }

  Future<bool> verifyUser(String phoneNumber, String password) async {
    await openUserHiveBox();
    if (userBox == null) {
      print('userbox is null');
      await openUserHiveBox();
      await verifyUser(phoneNumber, password);
    }
    try {
      print("try");
      final user = userBox!.values.firstWhere(
        (user) => user.phoneNumber == phoneNumber,
      );
      await SharedPreferce.saveUser(user);
      return user.password == password;
    } catch (e) {
      return false;
    }
  }
}
