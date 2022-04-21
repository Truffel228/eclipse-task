part of 'detailed_post_screen_bloc.dart';

abstract class DetailedPostScreenEvent extends Equatable {
  const DetailedPostScreenEvent();
}

class DetailedPostScreenFetchEvent extends DetailedPostScreenEvent {
  const DetailedPostScreenFetchEvent({required this.postId});
  final int postId;
  @override
  List<Object?> get props => [];
}

class DetailedPostScreenSaveCommentEvent extends DetailedPostScreenEvent {
  const DetailedPostScreenSaveCommentEvent({required this.comment});
  final Comment comment;
  @override
  List<Object?> get props => [];
}
