import 'package:clean_archtecture_template_abhay/domain/entities/dio_exception_contend.dart';
import 'package:dio/dio.dart';

class ApiExceptions {
  AlertBoxContent getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return AlertBoxContent(
            title: "Network issue", content: 'Bad Response error');

      case DioExceptionType.connectionError:
        return AlertBoxContent(
            title: "Network error", content: 'Connection Error');
      case DioExceptionType.connectionTimeout:
        return AlertBoxContent(
            title: "Network error", content: 'Connection time out');
      case DioExceptionType.cancel:
        return AlertBoxContent(
            title: "An error occured", content: 'Request cancelled');
      // 'Request cancelled';
      case DioExceptionType.receiveTimeout:
        return AlertBoxContent(
            title: "Network error", content: 'Recieve time out');
      // 'Recieve time out';
      default:
        return AlertBoxContent(
            title: "An error occured", content: 'Unknown error');
      // 'Unknown error';
    }
  }
}
