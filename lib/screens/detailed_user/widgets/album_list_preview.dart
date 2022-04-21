import 'package:eclipse_task/models/album/album/album.dart';
import 'package:eclipse_task/shared/routes.dart';
import 'package:eclipse_task/shared/widgets/album_list_item.dart';
import 'package:flutter/material.dart';

class AlbumListPreview extends StatelessWidget {
  const AlbumListPreview({
    Key? key,
    required this.itemCount,
    required this.albums,
  }) : super(key: key);
  final int itemCount;
  final List<Album> albums;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>Navigator.pushNamed(context, Routes.albums, arguments: albums),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Albums'),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (context, index) => AlbumListItem(
              album: albums[index],
            ),
          ),
        ],
      ),
    );
  }
}
