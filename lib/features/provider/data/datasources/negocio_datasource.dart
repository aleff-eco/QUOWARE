import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/negocio_model.dart';

abstract class NegocioDataSource {
  Future<void> addNegocio(NegocioModel negocioModel);
  Stream<List<NegocioModel>> getNegocios();
}

class NegocioDataSourceImpl implements NegocioDataSource {
  final FirebaseFirestore firebaseFirestore;

  NegocioDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<void> addNegocio(NegocioModel negocioModel) {
    return firebaseFirestore
        .collection('negocios')
        .add(negocioModel.toDocument());
  }

  @override
  Stream<List<NegocioModel>> getNegocios() {
    return firebaseFirestore.collection('negocios').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => NegocioModel.fromSnapshot(doc))
          .toList();
    });
  }
}
