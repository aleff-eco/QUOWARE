import 'package:flutter/material.dart';
import '../../../authentication/pages/login/login_welcome.dart';
import 'app_barCustomer.dart';
import '../../../authentication/pages/login/user_provider.dart';
import 'package:provider/provider.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: CustomAppBar(userName: userName,),
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
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IstokWeb',
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Consumidor",
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
                    const SizedBox(height: 45),
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
