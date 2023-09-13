import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:app_auth/features/authentication/pages/login/login_welcome.dart';
import 'package:app_auth/features/authentication/pages/login/user_provider.dart';
import '../../data/repositories/auth_register_respository.dart';
import '../../domain/entities/user_register.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterBase extends StatefulWidget {
  const RegisterBase({Key? key}) : super(key: key);

  @override
  _RegisterBaseState createState() => _RegisterBaseState();
}

class _RegisterBaseState extends State<RegisterBase> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _typeIdController = TextEditingController();
  late bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _typeIdController.dispose();
    super.dispose();
  }

  String? _selectedRole;
  final List<String> _roles = ['cliente', 'proveedor'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xFFE5E5E5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 37),
                    child: Text(
                      'Te damos la bienvenida...',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      _responsiveWidth(context, 0.15),
                      _responsiveHeight(context, 0.03),
                      _responsiveWidth(context, 0.1),
                      0,
                    ),
                    child: Text(
                      'Cuéntanos de ti:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.04)),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      fillColor: HexColor('#FFFFFF'),
                      filled: true,
                      hintStyle: TextStyle(
                        color: const Color(0xFF3B3936),
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.02)),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      hintText: 'Apellidos',
                      fillColor: HexColor('#FFFFFF'),
                      filled: true,
                      hintStyle: TextStyle(
                        color: const Color(0xFF3B3936),
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.02)),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: HexColor('#FFFFFF'),
                      filled: true,
                      hintStyle: TextStyle(
                        color: const Color(0xFF3B3936),
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.01)),
                  //seleccion de rol
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      _responsiveWidth(context, 0.15),
                      _responsiveHeight(context, 0.03),
                      _responsiveWidth(context, 0.1),
                      0,
                    ),
                    child: Text(
                      'Cuentanos, ¿Quién quieres ser?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.02)),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      fillColor: HexColor('#FFFFFF'),
                      filled: true,
                      hintText: 'Seleccione un rol',
                      hintStyle: TextStyle(
                        color: const Color(0xFF3B3936),
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    value: _selectedRole,
                    items: _roles.map((role) {
                      return DropdownMenuItem<String>(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.08)),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _passwordController,
                    autovalidateMode: AutovalidateMode.disabled,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      fillColor: HexColor('#FFFFFF'),
                      filled: true,
                      hintStyle: TextStyle(
                        color: const Color(0xFF3B3936),
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.02)),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _repeatPasswordController,
                    autovalidateMode: AutovalidateMode.disabled,
                    decoration: InputDecoration(
                      hintText: 'Repetir contraseña',
                      fillColor: HexColor('#FFFFFF'),
                      filled: true,
                      hintStyle: TextStyle(
                        color: const Color(0xFF3B3936),
                        fontSize: _responsiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: HexColor('#FFFFFF')),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: _responsiveHeight(context, 0.01)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        _registerUser();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: HexColor('#3B3936'),
                        textStyle: TextStyle(
                          fontSize: _responsiveTextSize(context, 17),
                          fontWeight: FontWeight.bold,
                        ),
                        minimumSize: Size(_responsiveWidth(context, 0.9),
                            _responsiveHeight(context, 0.07)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: HexColor('#3B3936'),
                            width: 12,
                          ),
                        ),
                      ),
                      child: const Text('Registrarse'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _responsiveWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }

  double _responsiveHeight(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }

  double _responsiveTextSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  // Método para realizar la petición POST
  void _registerUser() async {
    String name = _nameController.text;
    String lastName = _lastnameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    if (name.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        repeatPassword.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Todos los campos son obligatorios. Por favor, ingresa la información requerida.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (password != repeatPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Las contraseñas ingresadas no coinciden.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Las contraseñas son iguales, realiza la petición POST
    User user = User(
      name: name,
      lastName: lastName,
      email: email,
      password: password,
      type_users_id: _selectedRole == 'cliente' ? '1' : '2',
    );

    // Utilizamos el caso de uso para registrar al usuario
    bool registrationSuccess =
        await RegisterUserUseCase(RegisterDataRepository()).execute(user);

    if (registrationSuccess) {
      Fluttertoast.showToast(
        msg: 'Tu cuenta se ha creado exitosamente',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Provider.of<UserProvider>(context, listen: false).logoutUser();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginWelcome()),
        ModalRoute.withName('/home'),
      );
    } else {
      // Manejo de errores en la petición
      Fluttertoast.showToast(
        msg: 'Ha ocurrido un error, vuelva a intentarlo',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 175, 76, 76),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
