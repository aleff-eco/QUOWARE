import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<User?> loginUser(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://spokda7of4.execute-api.us-east-1.amazonaws.com/auth-services/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      Fluttertoast.showToast(
        msg: 'Bienvenido',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      if (response.statusCode == 200) {
        int userId = response.data["data"]["user"]["id"];
        int userType = response.data["data"]["user"]["type_users_id"];
        String userName = response.data["data"]["user"]["name"];
        return User(id: userId, userType: userType, userName: userName,);
      }
    } catch (error) {
        Fluttertoast.showToast(
        msg: 'Ha ocurrido un error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
        print('Error al realizar la petición POST: $error');
    }
    return null;
  }
}
