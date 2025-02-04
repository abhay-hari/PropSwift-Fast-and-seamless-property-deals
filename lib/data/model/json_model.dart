// ignore_for_file: overridden_fields

import 'package:propswift/domain/entities/json_enities.dart';

class JsonModel extends JsonEnities {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  JsonModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed})
      : super(
          userId: userId,
          id: id,
          title: title,
          completed: completed,
        );
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    return JsonModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
