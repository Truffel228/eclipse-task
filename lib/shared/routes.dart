import 'package:eclipse_task/screens/albums/albums/albums_screen.dart';
import 'package:eclipse_task/screens/albums/detailed_album/detailed_album_screen.dart';
import 'package:eclipse_task/screens/detailed_user/detailed_user_screen.dart';
import 'package:eclipse_task/screens/home/home_screen.dart';
import 'package:eclipse_task/screens/posts/detailed_post/detailed_post_screen.dart';
import 'package:eclipse_task/screens/posts/posts/posts_screen.dart';
import 'package:flutter/cupertino.dart';

abstract class Routes {
  static const String home = '/home';
  static const String detailedUser = '/detailedUser';
  static const String posts = '/posts';
  static const String detailedPost = '/detailedPost';
  static const String albums = '/albums';
  static const String detailedAlbum = '/detailedAlbum';

  static Map<String, WidgetBuilder> get routes => {
        home: (BuildContext context) => const HomeScreen(),
        detailedUser: (BuildContext context) => const DetailedUserScreen(),
        posts: (BuildContext context) => const PostsScreen(),
        detailedPost: (BuildContext context) => const DetailedPostScreen(),
        albums: (BuildContext context) => const AlbumsScreen(),
        detailedAlbum: (BuildContext context) => const DetailedAlbumScreen(),
      };
}
