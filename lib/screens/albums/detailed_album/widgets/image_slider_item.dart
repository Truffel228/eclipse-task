import 'package:eclipse_task/models/photo/photo.dart';
import 'package:eclipse_task/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({Key? key, required this.photo}) : super(key: key);
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.5;
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            photo.url,
            errorBuilder: (context, obj, st) => SvgPicture.asset(
              Constants.noInternetAsset,
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            photo.title,
            style: TextStyle(color: theme.primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
