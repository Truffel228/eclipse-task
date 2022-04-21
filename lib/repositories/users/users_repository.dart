import 'package:eclipse_task/models/user/user/user.dart';
import 'package:eclipse_task/repositories/users/users_repository_interface.dart';
import 'package:eclipse_task/services/users/users_service_interface.dart';

class UsersRepository implements UsersRepositoryInterface {
  UsersRepository({required UsersServiceInterface usersService})
      : _usersService = usersService;

  final UsersServiceInterface _usersService;

  @override
  Future<List<User>> fetchUsers() async {
    try{
      final List<User> users = await _usersService.fetchUsers();
      return users;
    }catch(e){
      print(e);
      throw Exception(e);
    }
  }
}
