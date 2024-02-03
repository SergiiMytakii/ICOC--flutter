import 'package:http/http.dart' as http;

class HttpService {
  static http.Client get client {
    var client = http.Client();
    return client;
  }
}
