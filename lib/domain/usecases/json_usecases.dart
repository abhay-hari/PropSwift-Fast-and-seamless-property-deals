import 'package:clean_archtecture_template_abhay/data/repositories/json_data_repo.dart';
import 'package:clean_archtecture_template_abhay/domain/repositories/json_domain_repo.dart';
import 'package:flutter/material.dart';

class JsonUsecases {
  static Future<String> callJsonPlaceholderApi(
      {required BuildContext context}) async {
    JsonDomainRepo domainRepo = JsonDataRepo();
    final data = await domainRepo.getDataFromJSonPlaceHolder(context: context);
    return data;
  }
}
