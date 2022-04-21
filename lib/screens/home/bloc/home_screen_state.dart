part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenLoading extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenLoaded extends HomeScreenState {
  HomeScreenLoaded({required this.users});
  final List<User> users;
  @override
  List<Object?> get props => [];
}

class HomeScreenError extends HomeScreenState {
  @override
  List<Object?> get props => [];
}
