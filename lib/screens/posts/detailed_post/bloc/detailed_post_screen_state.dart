part of 'detailed_post_screen_bloc.dart';

abstract class DetailedPostScreenState extends Equatable {
  const DetailedPostScreenState();
}

class DetailedPostScreenLoading extends DetailedPostScreenState {
  @override
  List<Object> get props => [];
}

class DetailedPostScreenLoaded extends DetailedPostScreenState {
  const DetailedPostScreenLoaded({required this.comments});
  final List<Comment> comments;
  @override
  List<Object?> get props => [];
}

class DetailedPostScreenError extends DetailedPostScreenState {
  @override
  List<Object?> get props => [];
}
