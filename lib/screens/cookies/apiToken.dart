import 'package:dio/dio.dart';

class ApiTokens {
  static String? accessToken;

  static void setAccessToken(String token) {
    accessToken = token;
  }

  static String? getAccessToken() {
    return accessToken;
  }
}

// Function to extract the access token from response headers
String? extractAccessTokenFromHeaders(Headers headers) {
  String? cookiesHeader = headers['set-cookie']?.first;
  if (cookiesHeader != null) {
    final accessTokenMatch = RegExp('access_token=([^;]+)').firstMatch(cookiesHeader);
    if (accessTokenMatch != null) {
      return accessTokenMatch.group(1);
    }
  }
  return null; // Access token not found in headers
}
