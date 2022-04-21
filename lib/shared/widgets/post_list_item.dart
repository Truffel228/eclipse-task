import 'package:eclipse_task/models/post/post.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.post,
    this.titleMaxLines = 1,
    this.bodyMaxLines = 1,
  }) : super(key: key);
  final Post post;
  final int? titleMaxLines;
  final int? bodyMaxLines;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            post.title,
            maxLines: titleMaxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            post.body,
            maxLines: bodyMaxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
