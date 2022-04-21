import 'package:eclipse_task/models/comment/comment.dart';

abstract class CommentsRepositoryInterface{
  Future<List<Comment>> fetchCommentsByPostId(int postId);
  Future<void> postComment(Comment comment);
}