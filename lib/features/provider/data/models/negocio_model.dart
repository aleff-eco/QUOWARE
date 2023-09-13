import 'package:cloud_firestore/cloud_firestore.dart';

class NegocioModel {
  final int userId;
  final String nombreNegocio;
  final String telefono;
  final String email;

  NegocioModel(
      {required this.userId,
      required this.nombreNegocio,
      required this.telefono,
      required this.email});

  factory NegocioModel.fromSnapshot(DocumentSnapshot doc) {
    return NegocioModel(
      userId: doc['userId'],
      nombreNegocio: doc['nombreNegocio'],
      telefono: doc['telefono'],
      email: doc['email'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'nombreNegocio': nombreNegocio,
      'telefono': telefono,
      'email': email,
    };
  }
}
