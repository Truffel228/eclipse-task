import 'package:eclipse_task/models/comment/comment.dart';
import 'package:eclipse_task/repositories/comments/comments_repository_interface.dart';
import 'package:eclipse_task/services/comments/comments_service_interface.dart';

class CommentsRepository implements CommentsRepositoryInterface {
  CommentsRepository({required CommentsServiceInterface commentsService})
      : _commentsService = commentsService;
  final CommentsServiceInterface _commentsService;
  @override
  Future<List<Comment>> fetchCommentsByPostId(int postId) async {
    try {
      final List<Comment> comments =
          await _commentsService.fetchCommentsByPostId(postId);
      return comments;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> postComment(Comment comment) async {
    try{
      await _commentsService.postComment(comment);
    }catch(e){
      throw Exception(e);
    }
  }
}
