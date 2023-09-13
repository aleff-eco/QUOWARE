import 'package:cloud_firestore/cloud_firestore.dart';

class ServicioModel {
  final int userId;
  final String titulo;
  final String descripcion;
  final String costo;
  final String tiempo;

  ServicioModel(
      {required this.userId,
      required this.titulo,
      required this.descripcion,
      required this.costo,
      required this.tiempo});

  factory ServicioModel.fromSnapshot(DocumentSnapshot doc) {
    return ServicioModel(
      userId: doc['userId'],
      titulo: doc['titulo'],
      descripcion: doc['descripcion'],
      costo: doc['costo'],
      tiempo: doc['tiempo'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'titulo': titulo,
      'descripcion': descripcion,
      'costo': costo,
      'tiempo': tiempo,
    };
  }
}
