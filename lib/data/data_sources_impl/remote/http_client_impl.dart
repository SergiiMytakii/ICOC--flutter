import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:icoc/domain/data_sources/remote/http_client.dart';
import 'package:icoc/core/constants.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: HttpClient)
class HttpClientImpl implements HttpClient {
  final http.Client _client = http.Client();

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    final browserHeaders = {
      'User-Agent':
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1',
      'Referer': ICOC_WEB_PAGE,
      'Accept': 'application/json',
      'Accept-Language': 'en-US,en;q=0.9',
    };

    final finalHeaders = <String, String>{};
    finalHeaders.addAll(browserHeaders);
    if (headers != null) {
      finalHeaders.addAll(headers);
    }
    return finalHeaders;
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    return _client.get(url, headers: _mergeHeaders(headers));
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return _client.post(
      url,
      headers: _mergeHeaders(headers),
      body: body,
    );
  }
}
