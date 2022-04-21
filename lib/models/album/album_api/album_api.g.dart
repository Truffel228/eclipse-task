// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumApi _$AlbumApiFromJson(Map<String, dynamic> json) => AlbumApi(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AlbumApiToJson(AlbumApi instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
    };
