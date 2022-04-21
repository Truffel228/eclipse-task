import 'package:json_annotation/json_annotation.dart';

part 'album_api.g.dart';

@JsonSerializable()
class AlbumApi {
  AlbumApi({
    required this.id,
    required this.userId,
    required this.title,

  });
  final int id;
  final int userId;
  final String title;


  factory AlbumApi.fromJson(Map<String, dynamic> json) => _$AlbumApiFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumApiToJson(this);
}
