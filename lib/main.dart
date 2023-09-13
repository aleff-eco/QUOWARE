import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:app_auth/features/authentication/pages/login/login_welcome.dart';
import './features/authentication/data/repositories/user_repository_impl.dart';
import './features/authentication/pages/login/user_provider.dart';
//import 'features/authentication/pages/login/login_registerProvider.dart';
//import 'features/authentication/pages/login/login_view.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_auth/features/provider/data/datasources/negocio_datasource.dart';
import 'package:app_auth/features/provider/data/repositories/negocio_repository_impl.dart';
import 'package:app_auth/features/provider/domain/usecases/negocio_usecase.dart';
// import 'package:app_auth/features/provider/presentation/pages/negocio_page.dart';
import 'package:app_auth/features/provider/data/datasources/servicio_datasource.dart';
import 'package:app_auth/features/provider/data/repositories/servicio_repository_impl.dart';
import 'package:app_auth/features/provider/domain/usecases/servicio_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio(); 

    UserRepositoryImpl userRepository = UserRepositoryImpl(dio);
    UserProvider userProvider = UserProvider(userRepository);

    return MultiProvider(
      providers: [
        Provider<NegocioDataSource>(
          create: (_) => NegocioDataSourceImpl(
              firebaseFirestore: FirebaseFirestore.instance),
        ),
        ProxyProvider<NegocioDataSource, NegocioUseCase>(
          update: (_, negocioDataSource, __) => NegocioUseCase(
              negocioRepository:
                  NegocioRepositoryImpl(negocioDataSource: negocioDataSource)),
        ),
        Provider<ServicioDataSource>(
          create: (_) => ServicioDataSourceImpl(
              firebaseFirestore: FirebaseFirestore.instance),
        ),
        ProxyProvider<ServicioDataSource, ServicioUseCase>(
          update: (_, servicioDataSource, __) => ServicioUseCase(
              servicioRepository: ServicioRepositoryImpl(
                  servicioDataSource: servicioDataSource)),
        ),
        ChangeNotifierProvider.value(value: userProvider),
      ],
      child: MaterialApp(
        title: 'My App',
        home: LoginWelcome(),
      ),
    );
  }
}
