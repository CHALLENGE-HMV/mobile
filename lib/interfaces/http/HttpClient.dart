import 'package:http/http.dart' as http;
import 'package:minha_saude/interfaces/http/helpers/http_helper.dart';

import 'enums/request_type.dart';


class HttpClient {
  const HttpClient._();

  static Map<String, String> _getHeaders() =>
      {'Content-Type': 'application/json'};

  static Future<http.Response>? _createRequest({
    required RequestType type,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    if (type == RequestType.get) {
      return http.get(uri, headers: headers);
    }
  }

  static Future<http.Response?>? send({
    required RequestType type,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    try {
      final _header = _getHeaders();
      final _url = HttpHelper.concatQueryString(url, queryParams);
      return await _createRequest(
          type: type, uri: Uri.parse(_url), headers: _header, body: body);
    } catch (ex) {
      return null;
    }
  }
}
