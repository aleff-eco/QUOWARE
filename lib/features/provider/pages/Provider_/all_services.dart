import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_auth/features/provider/domain/usecases/servicio_usecase.dart';
import 'package:app_auth/features/provider/domain/entities/servicio.dart';

import '../../../customer/pages/Customer/pedido.dart';

class ServicioPage extends StatefulWidget {
  const ServicioPage({Key? key, required this.userId}) : super(key: key);
  final int userId;
  @override
  _ServicioPageState createState() => _ServicioPageState();
}

class _ServicioPageState extends State<ServicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Servicios',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3B3936),
              ),
            ),
            backgroundColor: const Color(0xFFE5E5E5),
            elevation: 0,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 30,
            ),
            sliver: StreamBuilder<List<Servicio>>(
              stream: Provider.of<ServicioUseCase>(context).getServicios(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                } else {
                  final serviciosFiltrados = snapshot.data!
                      .where((servicio) => servicio.userId == widget.userId)
                      .toList();
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final servicio = serviciosFiltrados[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                  serviceTime: servicio.tiempo,
                                  totalAmount: servicio.costo,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    servicio.titulo,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Descripción: ${servicio.descripcion}\nCosto: ${servicio.costo}\nTiempo: ${servicio.tiempo}',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: serviciosFiltrados.length,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
