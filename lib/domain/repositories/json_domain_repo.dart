import 'package:flutter/material.dart';

abstract class JsonDomainRepo {
  Future<String> getDataFromJSonPlaceHolder({required BuildContext context});
}
