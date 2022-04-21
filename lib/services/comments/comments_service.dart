import 'package:dio/dio.dart';
import 'package:eclipse_task/models/comment/comment.dart';
import 'package:eclipse_task/services/comments/comments_service_interface.dart';
import 'package:eclipse_task/shared/constants.dart';
import 'package:eclipse_task/shared/http_client/http_client.dart';

class CommentsService implements CommentsServiceInterface {
  CommentsService({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;
  @override
  Future<List<Comment>> fetchCommentsByPostId(int postId) async {
    try {
      final Response response = await _httpClient.dio.get('https://jsonplaceholder.typicode.com/comments?postId=1');
      final List<dynamic> data = response.data as List<dynamic>;
      final List<Comment> comments =
          data.map((json) => Comment.fromJson(json)).toList();
      return comments;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<void> postComment(Comment comment) async {
    try {
      await _httpClient.dio
          .post(Constants.commentsEndPoint, data: comment.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
