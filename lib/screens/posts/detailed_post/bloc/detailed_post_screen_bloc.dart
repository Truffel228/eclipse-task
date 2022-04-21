import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eclipse_task/models/comment/comment.dart';
import 'package:eclipse_task/repositories/comments/comments_repository_interface.dart';
import 'package:equatable/equatable.dart';

part 'detailed_post_screen_event.dart';
part 'detailed_post_screen_state.dart';

class DetailedPostScreenBloc
    extends Bloc<DetailedPostScreenEvent, DetailedPostScreenState> {
  final CommentsRepositoryInterface _commentsRepository;
  DetailedPostScreenBloc(
      {required CommentsRepositoryInterface commentsRepository})
      : _commentsRepository = commentsRepository,
        super(DetailedPostScreenLoading()) {
    on<DetailedPostScreenFetchEvent>(_onDetailedPostScreenFetchEvent);
    on<DetailedPostScreenSaveCommentEvent>(_onDetailedPostScreenSaveCommentEvent);
  }
  void _onDetailedPostScreenFetchEvent(DetailedPostScreenFetchEvent event,
      Emitter<DetailedPostScreenState> emit) async {
    try {
      final List<Comment> comments =
          await _commentsRepository.fetchCommentsByPostId(event.postId);
      emit(DetailedPostScreenLoaded(comments: comments));
    } catch (e) {
      emit(DetailedPostScreenError());
    }
  }

  void _onDetailedPostScreenSaveCommentEvent(DetailedPostScreenSaveCommentEvent event,
      Emitter<DetailedPostScreenState> emit) async{
    final state = this.state;
    if(state is DetailedPostScreenLoaded){
      final List<Comment> comments = state.comments;
      try{
        emit(DetailedPostScreenLoading());
        await _commentsRepository.postComment(event.comment);
        comments.add(event.comment);
        emit(DetailedPostScreenLoaded(comments: comments));
      }catch(e){
        emit(DetailedPostScreenError());
      }
    }

  }
}
