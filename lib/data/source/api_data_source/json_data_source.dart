import 'package:clean_archtecture_template_abhay/config/const_values/const_values.dart';
import 'package:clean_archtecture_template_abhay/core/utils/api/dio_functions.dart';
import 'package:clean_archtecture_template_abhay/data/model/json_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class JsonDataSource {
  Future<String> getDataFormJSonPlaceHolder({required BuildContext context});
}

class JsonDataSourceImpl extends JsonDataSource {
  @override
  Future<String> getDataFormJSonPlaceHolder(
      {required BuildContext context}) async {
    // Headers
    final Map<String, String> headers = {
      // 'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
      'Content-Type': 'application/json',
    };
    // Request Body
    // final Map<String, dynamic> body = {
    //   'key1': 'value1',
    //   'key2': 'value2',
    // };

    final dio = await DioFunctions.dioInitalize();
    try {
      final response = await dio.get(
        ApiUrls.jsonPlaceHolderTodos,
        // options: Options(headers: headers),
        // data: body,
      );
      if (response.statusCode == 200) {
        final data = JsonModel.fromJson(response.data[0]);
        return data.title;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: ApiUrls.jsonPlaceHolderTodos),
          response: response,
          type: DioExceptionType.connectionError,
        );
        // return "";
      }
    } on DioException catch (e) {
      context.mounted ? DioFunctions.checkException(e, context) : null;
      // rethrow; //! double check the rethrow is need or not
      return "";
    } catch (e) {
      if (context.mounted) {
        DioFunctions.checkException(
            DioException(
              requestOptions:
                  RequestOptions(path: ApiUrls.jsonPlaceHolderTodos),
              type: DioExceptionType.unknown,
            ),
            context);
        return "";
      } else {
        return "";

        // rethrow; //! double check the rethrow is need or not
      }
    }
  }
}
