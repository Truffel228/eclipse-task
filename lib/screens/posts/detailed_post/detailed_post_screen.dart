import 'package:eclipse_task/models/comment/comment.dart';
import 'package:eclipse_task/models/post/post.dart';
import 'package:eclipse_task/repositories/comments/comments_repository_interface.dart';
import 'package:eclipse_task/screens/posts/detailed_post/bloc/detailed_post_screen_bloc.dart';
import 'package:eclipse_task/shared/constants.dart';
import 'package:eclipse_task/shared/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/widgets.dart';

class DetailedPostScreen extends StatefulWidget {
  const DetailedPostScreen({Key? key}) : super(key: key);

  @override
  State<DetailedPostScreen> createState() => _DetailedPostScreenState();
}

class _DetailedPostScreenState extends State<DetailedPostScreen> {
  late final Post post;
  late final DetailedPostScreenBloc bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    post = ModalRoute.of(context)!.settings.arguments as Post;
    bloc = DetailedPostScreenBloc(
        commentsRepository: context.read<CommentsRepositoryInterface>())
      ..add(DetailedPostScreenFetchEvent(postId: post.id));
    final double errorIconSize = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: BlocBuilder<DetailedPostScreenBloc, DetailedPostScreenState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is DetailedPostScreenLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              );
            }
            if (state is DetailedPostScreenLoaded) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PostListItem(
                      post: post,
                      titleMaxLines: 3,
                      bodyMaxLines: 10,
                    ),
                    const SizedBox(height: 20),
                    Text('Comments'),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) =>
                          CommentListItem(comment: state.comments[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) => Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: CommentForm(
                                onApply: _onCommentFormApply,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Leave a comment',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Constants.sadAsset,
                  width: errorIconSize,
                  height: errorIconSize,
                ),
                const SizedBox(height: 20),
                Text('Error has occurred'),
              ],
            ));
          }),
    );
  }

  void _onCommentFormApply(
          {required String name,
          required String email,
          required String comment}) =>
      bloc.add(
        DetailedPostScreenSaveCommentEvent(
          comment:
              Comment(postId: post.id, name: name, email: email, body: comment),
        ),
      );
}
