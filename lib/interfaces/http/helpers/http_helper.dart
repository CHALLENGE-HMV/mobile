import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minha_saude/interfaces/http/enums/response_error_type.dart';
import 'package:minha_saude/interfaces/http/http_typedef.dart';

class HttpHelper {
  const HttpHelper._();

  static String concatQueryString(
      String url, Map<String, String>? queryParams) {
    if (url.isEmpty) {
      return url;
    }
    if (queryParams == null || queryParams.isEmpty) {
      return url;
    }

    final StringBuffer stringBuffer = StringBuffer('$url?');
    queryParams.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) {
        throw Exception('Http QueryString Invalid Input');
      }
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 2);
  }

  static R filterResponse<R>(
      {required HttpCallBack callBack,
      required http.Response? response,
      required HttpOnFailureCallBackWithMessage onFailureCallBackWithMessage}) {
    try {
      if (response == null || response.body.isEmpty) {
        return onFailureCallBackWithMessage(
            HttpResponseErrorType.responseEmpty, 'Http Response is empty');
      }

      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
          {
            var json = jsonDecode(response.body);
            return callBack(json);
          }
        case 400:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.badRequest,
                'Request unknown or bad formatted');
          }
        case 401:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.unauthorized, 'Necessary authentication');
          }
        case 403:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.forbidden, 'Access denied to resource');
          }
        case 404:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.socket, 'Socket Fail');
          }
        case 500:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.serverError,
                'Server returned unknown error');
          }
        case 1708:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.socket, 'Socket Fail');
          }
        default:
          {
            return onFailureCallBackWithMessage(
                HttpResponseErrorType.didNotSuccess,
                'Http unknown error: $response.statusCode');
          }
      }
    } catch (ex) {
      return onFailureCallBackWithMessage(
          HttpResponseErrorType.exception, 'Http Exception $ex');
    }
  }
}
