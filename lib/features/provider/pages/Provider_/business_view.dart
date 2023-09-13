import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            // Nombre del negocio
            Container(
              height: 100,
              width: 500,
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Nombre del Negocio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IstokWeb',
                  fontSize: 24,
                ),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: 260,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 260,
                  enableInfiniteScroll: true,
                ),
                items: [
                  'https://www.upchiapas.edu.mx/media/3708/images/thumbs/c2a0956f3e8bed7276d17cf8d4a4f3b96c1b5d36.jpg',
                  'https://www.upchiapas.edu.mx/media/3706/images/thumbs/2a450cce12b274a01e019f7c465875e42050a90b.jpg',
                  'https://www.upchiapas.edu.mx/media/3691/images/thumbs/973d833e8d8ce7775e7ee0ffb78fb0f13abaefec.jpg',
                ].map((String imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(
                            10.0), // Agregar el padding deseado
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10), // Redondear las esquinas
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Descripción
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Descripción del negocio',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'IstokWeb',
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Carrusel de productos en 2 columnas con padding
            Padding(
              padding: const EdgeInsets.all(20.0), // Agregar el padding deseado
              child: SizedBox(
                height: 340,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10, // Número de productos
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.shopping_cart),
                        title: Text(
                          'Servicio $index',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'IstokWeb',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Fin
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '#123123123',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'IstokWeb',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
