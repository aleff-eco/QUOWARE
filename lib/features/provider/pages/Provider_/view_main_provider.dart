import 'package:flutter/material.dart';
import 'app_barProvider.dart';
import '../../../provider/pages/Provider_/business_view.dart';
import 'package:app_auth/features/provider/pages/Provider_/app_barProvider.dart';
import 'package:provider/provider.dart';
import 'package:app_auth/features/provider/domain/usecases/negocio_usecase.dart';
import 'package:app_auth/features/provider/domain/entities/negocio.dart';
import 'all_services.dart';

class ViewMain extends StatefulWidget {
  @override
  _ViewMainState createState() => _ViewMainState();
}

class _ViewMainState extends State<ViewMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: provider_appbar(),
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
}
