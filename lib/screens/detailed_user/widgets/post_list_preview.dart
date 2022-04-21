import 'package:eclipse_task/models/post/post.dart';
import 'package:eclipse_task/shared/routes.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:eclipse_task/shared/widgets/post_list_item.dart';
import 'package:flutter/material.dart';

class PostListPreview extends StatelessWidget {
  const PostListPreview(
      {Key? key, required this.posts, required this.itemCount})
      : super(key: key);
  final List<Post> posts;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.posts, arguments: posts),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Posts'),
          const SizedBox(height: 10),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (context, index) => PostListItem(
              post: posts[index],
            ),
          ),
        ],
      ),
    );
  }
}
