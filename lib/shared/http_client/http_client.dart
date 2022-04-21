import 'package:dio/dio.dart';
import 'package:eclipse_task/services/local_storage/local_storage_service_interface.dart';
import 'package:eclipse_task/shared/constants.dart';
import 'package:eclipse_task/shared/http_client/dio_interceptor.dart';

class HttpClient {
  HttpClient({required LocalStorageServiceInterface localStorageService}) {
    dio.interceptors
        .add(DioInterceptor(localStorageService: localStorageService));
  }

  final Dio dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));
}
