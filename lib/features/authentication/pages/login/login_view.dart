import 'package:flutter/material.dart';
import 'package:app_auth/features/customer/pages/Customer/profileCustomer.dart';
import 'package:app_auth/features/customer/pages/Customer/view_main_customer.dart';
import 'package:app_auth/features/provider/pages/Provider_/profileProvider.dart';
import 'package:provider/provider.dart';
import './user_provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el UserProvider mediante el Provider.of
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFFE5E5E5), // Fondo de color
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                const Positioned(
                  left: 27,
                  top: 53,
                  child: Text(
                    'Te damos la bienvenida...',
                    style: TextStyle(
                      fontFamily: 'Istok Web',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: -35,
                  top: 86,
                  child: Image.asset(
                    'assets/logo.png',
                    width: constraints.maxWidth + 70,
                    height: constraints.maxHeight * 0.3,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: constraints.maxHeight * 0.46,
                  child: SizedBox(
                    height: 52,
                    width: constraints.maxWidth - 40,
                    child: TextField(
                      controller: _emailController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        hintStyle: const TextStyle(
                          color: Color(0xFF3B3936),
                          fontFamily: 'Istok Web',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 42.0),
                Positioned(
                  left: 20,
                  top: constraints.maxHeight * 0.58,
                  child: SizedBox(
                    height: 52,
                    width: constraints.maxWidth - 40,
                    child: TextField(
                      controller: _passwordController,
                      textAlign: TextAlign.start,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        hintStyle: const TextStyle(
                          color: Color(0xFF3B3936),
                          fontFamily: 'Istok Web',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: constraints.maxHeight * 0.9,
                  child: SizedBox(
                    height: 43,
                    width: constraints.maxWidth - 40,
                    child: ElevatedButton(
                      onPressed: () {
                        _loginUser(userProvider);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: const Color(0xFF3B3936),
                      ),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontFamily: 'Istok Web',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _loginUser(UserProvider userProvider) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await userProvider.loginUser(email, password);
    if (userProvider.isLoggedIn) {
      int userType = userProvider.user!.userType;
      int userId = userProvider.user!.id;
      String userName = userProvider.user!.userName;
      print(userType);
      print(userId);
      print(userProvider.isLoggedIn);
      print(userName);
      if (userType == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerProfile(
                userName: userProvider.user?.userName ?? "Nombre de usuario"),
          ),
        );
      } else if (userType == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Provider_Profile(
                userName: userProvider.user?.userName ?? "Nombre de usuario",
                userId: userProvider.user?.id ?? 0),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text('Credenciales inválidas. Inténtalo de nuevo.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }
}
