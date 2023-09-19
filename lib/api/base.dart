import 'package:dio/dio.dart';
import 'package:login/utils/exceptions.dart';

import '../utils/parsing.dart';

class MyApiServices {
  Dio dio = Dio();

  MyApiServices() {
    dio = Dio();
    dio.options.baseUrl =
        'http://3.7.74.242:3000'; // Replace with your base URL

    // Set the connectTimeout and receiveTimeout as Duration objects
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    setToken();
  }

  void setToken() {
    dio.options.headers = {
      'Cookie':
          'access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDIwMDA0NTdhYjdhOGZjZTVkNDJjOSIsImlhdCI6MTY5NDY3ODYwMn0.4nTKK5GeTXIV7gvVOYl4ccT5YiAhCbteUhsHal927C8'
    };
    // dio.options.headers["Authorization"] =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZWIyMmRhZDEzYTAwM2M5ZWI3NDI0OCIsImlhdCI6MTY5MzM4NDI0NywiZXhwIjoxNjkzNjQzNDQ3fQ.eG-X2jS4AGz40vud2WrF9KC8YCDG4F-rPcAYkZ28_iE";
    // UserSessionManager.shared.token.isNotEmpty
    //     ? UserSessionManager.shared.token
    //     : UserSessionManager.shared.guestUserId;
  }

  GlobalException getException(dynamic error) {
    if (error == null || ((error is DioError) == false))
      return const GeneralException();
    final dioError = error as DioError;
    switch (dioError.type) {
      case DioExceptionType.badResponse:
        dynamic mapData =
            dioError.response!.data is Map ? dioError.response!.data : {};
        String message = Parsing.stringFrom(mapData['error']);
        if (message.isEmpty) {
          // Checking if the error comes in array of strings format
          List<String> messages = Parsing.arrayFrom(mapData['error'])!
              .map((element) => Parsing.stringFrom(element))
              .where((element) => element.isNotEmpty)
              .toList();
          if (messages.isNotEmpty) message = messages.first;
        }
        if (message.isEmpty) message = Parsing.stringFrom(mapData['message']);
        if (message.isEmpty) message = dioError.response!.statusMessage!;
        return ApiResponseException(
            message: message, status: dioError.response!.statusCode!);
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const ApiTimedOutException();
      default:
        return const InternetConnectivityException();
    }
  }

  // You can add other common configurations and methods here
}
