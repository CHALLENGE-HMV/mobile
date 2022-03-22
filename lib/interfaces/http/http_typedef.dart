import 'package:minha_saude/interfaces/http/enums/response_error_type.dart';

typedef HttpCallBack<R> = R Function(dynamic);
typedef HttpOnFailureCallBackWithMessage<R> = R Function(HttpResponseErrorType, String?);
