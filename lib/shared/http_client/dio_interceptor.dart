import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eclipse_task/services/local_storage/local_storage_service_interface.dart';
import 'package:eclipse_task/shared/constants.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({
    required LocalStorageServiceInterface localStorageService,
  }) : _localStorageService = localStorageService;
  final LocalStorageServiceInterface _localStorageService;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Если делаем запрос юзеров, проверяем наличие таковых в кэше, если
    /// список юзеров уже в кэше возвращаем данные из кэша
    if (options.path.contains(Constants.usersEndPoint)) {
      /// Если данные по [Constants.usersEndPoint] ключу есть в хранилище
      /// Возвращаем данные из него
      if (_localStorageService.getString(Constants.usersEndPoint) != null) {
        final String codedData =
            _localStorageService.getString(Constants.usersEndPoint)!;
        final List<dynamic> data = json.decode(codedData);
        return handler.resolve(Response(data: data, requestOptions: options));
      }

      /// Если хранилище пусто делаем обычный запрос
      return super.onRequest(options, handler);
    }

    /// Если делаем запрос альбомов, проверяем наличие таковых в кэше, если
    /// список юзеров уже в кэше возвращаем данные из кэша
    if (options.path.contains(Constants.albumsEndPoint)) {
      if (_localStorageService.getString(Constants.albumsEndPoint) != null) {
        final String codedData =
            _localStorageService.getString(Constants.albumsEndPoint)!;
        final List<dynamic> data = json.decode(codedData);
        return handler.resolve(Response(data: data, requestOptions: options));
      }

      return super.onRequest(options, handler);
    }

    /// Если делаем запрос постов, проверяем наличие таковых в кэше, если
    /// список юзеров уже в кэше возвращаем данные из кэша
    if (options.path.contains(Constants.postsEndPoint)) {
      if (_localStorageService.getString(Constants.postsEndPoint) != null) {
        final String codedData =
            _localStorageService.getString(Constants.postsEndPoint)!;
        final List<dynamic> data = json.decode(codedData);
        return handler.resolve(Response(data: data, requestOptions: options));
      }

      return super.onRequest(options, handler);
    }

    /// Если делаем запрос фотографий, проверяем наличие таковых в кэше, если
    /// список юзеров уже в кэше возвращаем данные из кэша
    if (options.path.contains(Constants.photosEndPoint)) {
      if (_localStorageService.getString(Constants.photosEndPoint) != null) {
        final String codedData =
            _localStorageService.getString(Constants.photosEndPoint)!;
        final List<dynamic> data = json.decode(codedData);
        return handler.resolve(Response(data: data, requestOptions: options));
      }

      return super.onRequest(options, handler);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    /// Если запрос был на пользователей, сохраняем ответ в локальном хранилище
    if (response.requestOptions.path.contains(Constants.usersEndPoint)) {
      await _localStorageService.setString(
          key: Constants.usersEndPoint, value: json.encode(response.data));
    }

    /// Если запрос был на альбомы, сохраняем ответ в локальном хранилище
    if (response.requestOptions.path.contains(Constants.albumsEndPoint)) {
      await _localStorageService.setString(
          key: Constants.albumsEndPoint, value: json.encode(response.data));
    }

    /// Если запрос был на посты, сохраняем ответ в локальном хранилище
    if (response.requestOptions.path.contains(Constants.postsEndPoint)) {
      await _localStorageService.setString(
          key: Constants.postsEndPoint, value: json.encode(response.data));
    }

    /// Если запрос был на фотографии, сохраняем ответ в локальном хранилище
    if (response.requestOptions.path.contains(Constants.photosEndPoint)) {
      await _localStorageService.setString(
          key: Constants.photosEndPoint, value: json.encode(response.data));
    }
    super.onResponse(response, handler);
  }
}
