import 'package:eclipse_task/models/user/user/user.dart';

abstract class UsersServiceInterface {
  Future<List<User>> fetchUsers();
}
