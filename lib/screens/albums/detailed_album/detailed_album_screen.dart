
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eclipse_task/models/album/album/album.dart';
import 'package:eclipse_task/models/photo/photo.dart';
import 'package:flutter/material.dart';

import 'widgets/widget.dart';

class DetailedAlbumScreen extends StatelessWidget {
  const DetailedAlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Album album = ModalRoute.of(context)!.settings.arguments as Album;
    final List<Photo> photos = album.photos;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              album.title,
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CarouselSlider.builder(
              itemCount: photos.length,
              itemBuilder: (context, index, realIndex) => ImageSliderItem(
                photo: photos[index],
              ),
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.6),
            ),
          ],
        ),
      ),
    );
  }
}
