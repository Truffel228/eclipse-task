import 'package:dio/dio.dart';
import 'package:eclipse_task/models/album/album/album.dart';
import 'package:eclipse_task/models/album/album_api/album_api.dart';
import 'package:eclipse_task/models/photo/photo.dart';
import 'package:eclipse_task/models/post/post.dart';
import 'package:eclipse_task/models/user/user/user.dart';
import 'package:eclipse_task/models/user/user_api/user_api.dart';
import 'package:eclipse_task/services/users/users_service_interface.dart';

import '../../shared/http_client/http_client.dart';

class UsersService implements UsersServiceInterface {
  UsersService({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;

  /// Получаем список юзеров с бэка после чего с помощью [UserApi], [Album], [Post]
  /// формируем модель entity [User] и возвращаем списоком
  @override
  Future<List<User>> fetchUsers() async {
    try {
      final List<User> users = [];

      final Response response = await _httpClient.dio.get('/users');

      ///TODO: Нужна ли здесь проверка на response.statusCode == 200 ???
      final List<dynamic> data = response.data as List<dynamic>;
      final List<UserApi> userApis =
          data.map((json) => UserApi.fromJson(json)).toList();

      final List<Album> albums = await _fetchAlbums();
      final List<Post> posts = await _fetchPosts();

      for (final userApi in userApis) {
        final int userId = userApi.id;

        final List<Album> userAlbums =
            albums.where((album) => userId == album.userId).toList();

        final List<Post> userPosts =
            posts.where((post) => userId == post.userId).toList();
        users.add(
          User.fromApi(
            userApi: userApi,
            posts: userPosts,
            albums: userAlbums,
          ),
        );
      }
      return users;
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Получаем список альбомов с бэка
  Future<List<Album>> _fetchAlbums() async {
    final List<Album> albums = [];
    final Response response = await _httpClient.dio.get('/albums');
    final List<dynamic> data = response.data as List<dynamic>;
    final List<AlbumApi> albumApis =
        data.map((json) => AlbumApi.fromJson(json)).toList();
    final List<Photo> photos = await _fetchPhotos();

    /// Парсим два листа (albumApis, photos) в один лист [Album]
    for(final albumApi in albumApis){
      final int albumId = albumApi.id;
      final List<Photo> albumPhotos = photos.where((photo) => albumId == photo.albumId).toList();
      albums.add(Album.fromApi(albumApi: albumApi, photos: albumPhotos));
    }

    return albums;
  }

  /// Получаем список фотографий с бэка
  Future<List<Photo>> _fetchPhotos() async {
    final Response response = await _httpClient.dio.get('/photos');
    final List<dynamic> data = response.data as List<dynamic>;
    final List<Photo> photos =
        data.map((json) => Photo.fromJson(json)).toList();
    return photos;
  }

  /// Получаем список постов с бэка
  Future<List<Post>> _fetchPosts() async {
    final Response response = await _httpClient.dio.get('/posts');
    final List<dynamic> data = response.data as List<dynamic>;
    final List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
    return posts;
  }
}
