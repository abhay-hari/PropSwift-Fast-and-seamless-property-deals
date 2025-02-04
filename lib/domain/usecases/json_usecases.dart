import 'package:propswift/data/repositories/json_data_repo.dart';
import 'package:propswift/domain/repositories/json_domain_repo.dart';
import 'package:flutter/material.dart';

class JsonUsecases {
  static Future<String> callJsonPlaceholderApi(
      {required BuildContext context}) async {
    JsonDomainRepo domainRepo = JsonDataRepo();
    final data = await domainRepo.getDataFromJSonPlaceHolder(context: context);
    return data;
  }
}
