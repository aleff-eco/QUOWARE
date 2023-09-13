import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../authentication/pages/login/login_registerProvider.dart';
import '../../../authentication/pages/login/login_welcome.dart';
import '../../../authentication/pages/login/user_provider.dart';
import 'app_barProvider.dart';
import 'create_service.dart';

class Provider_Profile extends StatefulWidget {
  const Provider_Profile(
      {Key? key, required this.userName, required this.userId})
      : super(key: key);
  final String userName;
  final int userId;

  @override
  State<Provider_Profile> createState() => _Provider_ProfileState();
}

class _Provider_ProfileState extends State<Provider_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: provider_appbar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                "Mi cuenta",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IstokWeb',
                  fontSize: 18.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ClipOval(
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFE5E5E5),
                        radius: 70,
                        backgroundImage: AssetImage('assets/perfilUsuario.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IstokWeb',
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Proveedor",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IstokWeb',
                        fontSize: 18.0,
                        color: Color(0xFF707070),
                      ),
                    ),
                    const SizedBox(height: 49),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 110.0),
                          child: Text(
                            "Cambiar nombre",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IstokWeb',
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.lock),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 110.0),
                          child: Text(
                            "Cambiar foto del perfil",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IstokWeb',
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.lock),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 110.0),
                          child: Text(
                            "Cambiar contraseña",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IstokWeb',
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.lock),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 110.0),
                          child: Text(
                            "Cambiar dirección",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IstokWeb',
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.lock),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterProvider(
                                          key: const Key('registerProvider'),
                                          userId: widget.userId,
                                        )),
                              );
                            },
                            child: const Text(
                              "Crear un Negocio",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'IstokWeb',
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.add),
                      ],
                    ),
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        service_create(userId: widget.userId)),
                              );
                            },
                            child: const Text(
                              "Crear un servicio",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'IstokWeb',
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.add),
                      ],
                    ),
                    const SizedBox(height: 35),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false).logoutUser();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginWelcome()),
            ModalRoute.withName('/home'),
          );
        },
        label: const Text(
          "Salir",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'IstokWeb',
            fontSize: 18.0,
          ),
        ),
        icon: const Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
