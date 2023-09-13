import '../entities/user_register.dart';
import '../repositories/auth_registerUser.dart';

class RegisterUserUseCase {
  final RegisterRepository _registerRepository;

  RegisterUserUseCase(this._registerRepository);

  Future<bool> execute(User user) async {
    return await _registerRepository.registerUser(user);
  }
}
