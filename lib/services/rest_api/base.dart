import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/rest_api/exceptions.dart';
import '../../../resources/constants/constants.dart';
import '../../../utilities/connectivity.dart';
import '../../../utilities/core/parsing.dart';


abstract class RestApiBaseService {
  Dio dio = Dio();

  RestApiBaseService() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
    );
    dio = Dio(options);
  }

   setToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String firebaseToken = prefs.getString('user_token') ?? '';
    print("Firebase Token: Bearer "+firebaseToken);
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${firebaseToken}";
    print("Authorization Token:"+dio.options.headers["Authorization"].toString());
  }


  /// Helper Method - [getException]
  /// Return our own [Exception] from the [DioErrorType]
  RootException getException(dynamic error) {
    if (error == null || ((error is DioError) == false)) {
      return const GeneralException();
    }
    final dioError = error as DioError;
    switch (dioError.type) {
      case DioExceptionType.badResponse:
        dynamic mapData =
            dioError.response!.data is Map ? dioError.response!.data : {};
        String message = Parsing.stringFrom(mapData['error_description']);
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
        if (ConnectivityManager.shared.isNotAvailable()) {
          return const InternetConnectivityException();
        }
        return GeneralException(status: dioError.response!.statusCode!);
    }
  }
}
