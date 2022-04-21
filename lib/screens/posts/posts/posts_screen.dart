import 'package:eclipse_task/models/post/post.dart';
import 'package:eclipse_task/shared/routes.dart';
import 'package:eclipse_task/shared/widgets/post_list_item.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Post> posts =
        ModalRoute.of(context)!.settings.arguments as List<Post>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => InkWell(
          onTap: ()=>Navigator.pushNamed(context, Routes.detailedPost, arguments: posts[index]),
          child: PostListItem(
            post: posts[index],
            titleMaxLines: 3,
            bodyMaxLines:  10,
          ),
        ),
      ),
    );
  }
}
