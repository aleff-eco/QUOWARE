import 'package:flutter/material.dart';
import '../../../provider/pages/Provider_/business_view.dart';
import 'app_barCustomer.dart';

import 'package:provider/provider.dart';
import 'package:app_auth/features/provider/domain/usecases/negocio_usecase.dart';
import 'package:app_auth/features/provider/domain/entities/negocio.dart';
import 'package:app_auth/features/provider/pages/Provider_/all_services.dart';

class ViewMainCustomer extends StatelessWidget {
  const ViewMainCustomer({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: CustomAppBar(
        userName: userName,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            buildDrawerListItem('Cuidado personal'),
            buildDrawerListItem('Salud'),
            buildDrawerListItem('Servicio vehicular'),
            buildDrawerListItem('Asistencia del hogar'),
          ],
        ),
      ),
      body: StreamBuilder<List<Negocio>>(
        stream: Provider.of<NegocioUseCase>(context).getNegocios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final negocio = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[200],
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicioPage(
                              userId: negocio.userId,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        negocio.nombreNegocio,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Teléfono: ${negocio.telefono} \nEmail: ${negocio.email}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget buildDrawerListItem(String title) {
    return ListTile(
      title: Text(
        '• $title',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'IstokWeb',
          fontSize: 16.0,
        ),
      ),
      onTap: () {
        // Acción al seleccionar el elemento del Drawer
      },
    );
  }
}
