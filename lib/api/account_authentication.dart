import 'package:dio_rxdart_bloc/model/account.dart';
import 'package:dio/dio.dart';

class AccountAuthentication {
  final String _endpoint = "https://randomuser.me/api/";
  // final Dio _dio = Dio();

  Dio _dio;

  AccountAuthentication() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 5000, connectTimeout: 5000, sendTimeout: 5000);
    _dio = Dio(options);

    _setupInterceptor();
  }

  Future<Account> login() async {
    try {
      Response response = await _dio.get(_endpoint);
      // print(response.data);
      return Account.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Account.withError(_handleDioError(error));
    } catch (error) {
      return Account.withError(
          "Failed to retrive data from server. Please try again.");
    }
  }

  String _handleDioError(DioError error) {
    String errorDescription = '';
    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
            "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Send timeout in connection with API server";
        break;
      default:
        errorDescription = "Accessing API server failed.";
    }
    return errorDescription;
  }

  void _setupInterceptor() {
    int maxCharactersPerLine = 200;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("--> ${options.method} ${options.path}");
      print("Content type: ${options.contentType}");
      print("<-- END HTTP");
    }, onResponse: (Response response) {
      print(
          "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
      String responseAsString = response.data.toString();
      if (responseAsString.length > maxCharactersPerLine) {
        int iterations =
            (responseAsString.length / maxCharactersPerLine).floor();
        for (int i = 0; i <= iterations; i++) {
          int endIndex = i * maxCharactersPerLine + maxCharactersPerLine;
          if (endIndex > responseAsString.length) {
            endIndex = responseAsString.length;
          }
          print(responseAsString.substring(i * maxCharactersPerLine, endIndex));
        }
      } else {
        print(responseAsString);
      }
      print("<-- END HTTP");
    }));
  }
}
