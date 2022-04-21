import 'package:eclipse_task/models/album/album/album.dart';
import 'package:eclipse_task/shared/constants.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            album.photos.first.thumbnailUrl,
            errorBuilder: (context, obj, st) => SvgPicture.asset(
              Constants.noInternetAsset,
              width: 25,
              height: 25,
            ),
          ),
        ),
        title: Text(album.title),
      ),
    );
  }
}
