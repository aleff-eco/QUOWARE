import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../provider/pages/Provider_/profileProvider.dart';
import 'package:provider/provider.dart';

import 'package:app_auth/features/provider/domain/usecases/negocio_usecase.dart';
import 'package:app_auth/features/provider/domain/entities/negocio.dart';

class RegisterProvider extends StatefulWidget {
  const RegisterProvider({required Key key, required this.userId})
      : super(key: key);
  final int userId;

  @override
  _RegisterProviderState createState() => _RegisterProviderState();
}

class _RegisterProviderState extends State<RegisterProvider> {
  final _nombreNegocioController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nombreNegocioController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final negocioUseCase = Provider.of<NegocioUseCase>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text(
          'Crear un negocio',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3B3936),
          ),
        ),
        backgroundColor: const Color(0xFFE5E5E5),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 1, top: 37),
                  child: Text(
                    'Cuéntanos de tu negocio:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: _nombreNegocioController,
                  decoration: InputDecoration(
                    hintText: 'Nombre del negocio',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Color(0xFF3B3936),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
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
                ), //////////////////////////////////////////////////////
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: _telefonoController,
                  decoration: InputDecoration(
                    hintText: 'Telefono',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Color(0xFF3B3936),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
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

                const SizedBox(height: 20),

                TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: HexColor('#FFFFFF'),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Color(0xFF3B3936),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
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
                //////////////////////////////////7
                const SizedBox(height: 88),
                ElevatedButton(
                  onPressed: () {
                    if (_nombreNegocioController.text.trim().isEmpty ||
                        _telefonoController.text.trim().isEmpty ||
                        _emailController.text.trim().isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Campos Vacíos'),
                          content: Text(
                              'Por favor, completa todos los campos antes de crear el negocio.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    final newNegocio = Negocio(
                      userId: widget.userId,
                      nombreNegocio: _nombreNegocioController.text,
                      telefono: _telefonoController.text,
                      email: _emailController.text,
                    );
                    negocioUseCase.addNegocio(newNegocio);

                    _nombreNegocioController.clear();
                    _telefonoController.clear();
                    _emailController.clear();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF486966),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size(321, 51),
                  ),
                  child: const Text(
                    'Crear mi negocio',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'IstokWeb',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
