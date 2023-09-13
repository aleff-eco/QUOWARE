// user_provider.dart - Capa de Presentación

import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';


class UserProvider extends ChangeNotifier {
  final UserRepository _userRepository;

  UserProvider(this._userRepository);

  bool _isLoggedIn = false;
  User? _user;

  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;

  Future<void> loginUser(String email, String password) async {
    User? user = await _userRepository.loginUser(email, password);
    if (user != null) {
      _isLoggedIn = true;
      _user = user;
      notifyListeners();
    } else {
      // Mostrar mensaje de error
    }
  }

  void logoutUser() {
    _isLoggedIn = false;
    _user = null;
    notifyListeners();
  }
}