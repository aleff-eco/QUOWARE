import '../entities/user.dart';

abstract class UserRepository {
  Future<User?> loginUser(String email, String password);
}
