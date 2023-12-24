import 'package:dio/dio.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio init() {
    var dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
        followRedirects: false,
        headers: <String, String>{}
      )
    );

    final interceptors = InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        /*if (error.response?.statusCode == 401) {
          
        }*/

        return handler.next(error);
      }
    );

    dio.interceptors.add(interceptors);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 150
      )
    );

    return dio;
  }

  Dio dio = init();
}