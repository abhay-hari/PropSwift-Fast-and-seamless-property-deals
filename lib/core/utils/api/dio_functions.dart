import 'package:clean_archtecture_template_abhay/core/utils/api/api_exception/api_exceptions.dart';
import 'package:clean_archtecture_template_abhay/domain/entities/dio_exception_contend.dart';
import 'package:clean_archtecture_template_abhay/features/widgets/platform_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioFunctions {
  static Future<Dio> dioInitalize() async {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 8),
      sendTimeout: const Duration(seconds: 8),
    ));
    return dio;
  }

  static void checkException(DioException exception, BuildContext context) {
    ApiExceptions apiExceptions = ApiExceptions();
    AlertBoxContent errorMessage = apiExceptions.getExceptionMessage(exception);
    showPlatformAlert(
      context: context,
      title: errorMessage.title,
      content: errorMessage.content,
    );
  }
}
