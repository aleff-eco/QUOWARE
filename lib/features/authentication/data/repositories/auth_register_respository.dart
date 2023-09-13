import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../domain/entities/user_register.dart';
import '../../domain/repositories/auth_registerUser.dart';

class RegisterDataRepository implements RegisterRepository {
  final Dio dio = Dio();

  @override
  Future<bool> registerUser(User user) async {
    const String registerUrl =
        'https://spokda7of4.execute-api.us-east-1.amazonaws.com/auth-services/auth/register';

    try {
      final response = await dio.post(
        registerUrl,
        data: {
          'name': user.name,
          'last_name': user.lastName,
          'email': user.email,
          'password': user.password,
          'type_users_id': user.type_users_id,
        },
      );
      Fluttertoast.showToast(
        msg: 'Bienvenido a QUOWARE',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      if (kDebugMode) {
        print(response.statusCode);
      }
      return response.statusCode == 200;
    } catch (error) {
      if (kDebugMode) {
        print('Error en la petición: $error');
      }
      return false;
    }
  }
}
