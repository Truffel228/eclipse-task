import 'package:eclipse_task/models/comment/comment.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:flutter/material.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({Key? key, required this.comment}) : super(key: key);
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            children: [
              Text('Name:'),
              const SizedBox(width: 10),
              Text(
                comment.body,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            children: [
              Text('Email:'),
              const SizedBox(width: 10),
              Text(
                comment.email,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(comment.body),
        ],
      ),
    );
  }
}
