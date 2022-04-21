import 'package:eclipse_task/models/address/address.dart';
import 'package:eclipse_task/models/album/album/album.dart';
import 'package:eclipse_task/models/company/company.dart';
import 'package:eclipse_task/models/post/post.dart';

import '../user_api/user_api.dart';

/// Модель которую мы непосредственно передаём в UI (entity)
class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.albums,
    required this.posts,
    required this.address,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;
  final List<Album> albums;
  final List<Post> posts;

  factory User.fromApi(
          {required UserApi userApi,
          required List<Album> albums,
          required List<Post> posts}) =>
      User(
        id: userApi.id,
        name: userApi.name,
        username: userApi.username,
        email: userApi.email,
        phone: userApi.phone,
        website: userApi.website,
        company: userApi.company,
        address: userApi.address,
        albums: albums,
        posts: posts,
      );
}
