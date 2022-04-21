import 'package:eclipse_task/models/album/album_api/album_api.dart';
import 'package:eclipse_task/models/photo/photo.dart';

/// Сама модель entity которую мы будем передавать в [User]
class Album {
  Album({
    required this.photos,
    required this.id,
    required this.userId,
    required this.title,
  });

  final int id;
  final int userId;
  final String title;
  final List<Photo> photos;

  factory Album.fromApi(
          {required AlbumApi albumApi, required List<Photo> photos}) =>
      Album(
        title: albumApi.title,
        id: albumApi.id,
        userId: albumApi.userId,
        photos: photos,
      );
}
