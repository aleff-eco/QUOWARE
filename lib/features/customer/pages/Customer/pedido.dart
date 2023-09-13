import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatelessWidget {
  final String totalAmount; // Total a pagar
  final String serviceTime; // Método de pago seleccionado

  PaymentScreen({required this.totalAmount, required this.serviceTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resumen del pedido:',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3B3936),
          ),
        ),
        backgroundColor: const Color(0xFFE5E5E5),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(
                  40), // Ajusta el valor según el espacio deseado
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monto Total:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${totalAmount}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 87, 143, 70),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tiempo del servicio:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    serviceTime,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 113, 174, 231)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _proceedToPayment(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B3936),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(10, 60),
              ),
              child: const Text(
                'Proceder al pago',
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
    );
  }

  void _proceedToPayment(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'Los pagos no estan disponibles en este momento',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
      webPosition: "center",
    );
  }
}
