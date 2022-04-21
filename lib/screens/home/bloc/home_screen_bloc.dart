import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eclipse_task/models/user/user/user.dart';
import 'package:eclipse_task/repositories/users/users_repository_interface.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final UsersRepositoryInterface _usersRepository;

  HomeScreenBloc({required UsersRepositoryInterface usersRepository})
      : _usersRepository = usersRepository,
        super(HomeScreenLoading()) {
    on<HomeScreenFetchUsersEvent>(_onHomeScreenFetchUsersEvent);
  }

  void _onHomeScreenFetchUsersEvent(
      HomeScreenFetchUsersEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try {
      final List<User> users = await _usersRepository.fetchUsers();
      emit(HomeScreenLoaded(users: users));
    } catch (e) {
      print(e);
      emit(HomeScreenError());
    }
  }
}
