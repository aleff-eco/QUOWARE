import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/servicio_model.dart';

abstract class ServicioDataSource {
  Future<void> addServicio(ServicioModel servicioModel);
  Stream<List<ServicioModel>> getServicios();
}

class ServicioDataSourceImpl implements ServicioDataSource {
  final FirebaseFirestore firebaseFirestore;

  ServicioDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<void> addServicio(ServicioModel servicioModel) {
    return firebaseFirestore
        .collection('servicios')
        .add(servicioModel.toDocument());
  }

  @override
  Stream<List<ServicioModel>> getServicios() {
    return firebaseFirestore
        .collection('servicios')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ServicioModel.fromSnapshot(doc))
          .toList();
    });
  }
}
