import 'package:http/http.dart';

abstract class HttpClient {
  Future<Response> get(Uri url, {Map<String, String>? headers});
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  });
}
