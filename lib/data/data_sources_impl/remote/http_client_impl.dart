import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:icoc/core/data_sources/remote/http_client.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: HttpClient)
class HttpClientImpl implements HttpClient {
  final http.Client _client = http.Client();

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    return _client.get(url, headers: headers);
  }
}
