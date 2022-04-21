import 'package:eclipse_task/models/album/album/album.dart';
import 'package:eclipse_task/shared/routes.dart';
import 'package:eclipse_task/shared/widgets/album_list_item.dart';
import 'package:flutter/material.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Album> albums =
        ModalRoute.of(context)!.settings.arguments as List<Album>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            Routes.detailedAlbum,
            arguments: albums[index],
          ),
          child: AlbumListItem(
            album: albums[index],
          ),
        ),
      ),
    );
  }
}
