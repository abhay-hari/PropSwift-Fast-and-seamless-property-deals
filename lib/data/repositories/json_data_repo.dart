import 'package:propswift/data/source/api_data_source/json_data_source.dart';
import 'package:propswift/domain/repositories/json_domain_repo.dart';
import 'package:flutter/material.dart';

class JsonDataRepo extends JsonDomainRepo {
  JsonDataSource source = JsonDataSourceImpl();

  @override
  Future<String> getDataFromJSonPlaceHolder(
      {required BuildContext context}) async {
    final data = await source.getDataFormJSonPlaceHolder(context: context);
    return data;
  }
}
