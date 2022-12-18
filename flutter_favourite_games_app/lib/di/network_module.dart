import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio get dio {
    final _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      handler.next(request);
    }));
    return _dio;
  }
}
