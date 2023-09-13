import '../entities/user_register.dart';

abstract class RegisterRepository {
  Future<bool> registerUser(User user);
}
