import 'package:eclipse_task/models/user/user/user.dart';

abstract class UsersRepositoryInterface {
  Future<List<User>> fetchUsers();
}
