part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class HomeScreenFetchUsersEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}
