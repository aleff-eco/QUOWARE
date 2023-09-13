import '../../data/datasources/negocio_datasource.dart';
import '../models/negocio_model.dart';
import '../../domain/entities/negocio.dart';
import '../../domain/repositories/negocio_repository.dart';

class NegocioRepositoryImpl implements NegocioRepository {
  final NegocioDataSource negocioDataSource;

  NegocioRepositoryImpl({required this.negocioDataSource});

  @override
  Future<void> addNegocio(Negocio negocio) {
    final negocioModel = NegocioModel(
      userId: negocio.userId,
      nombreNegocio: negocio.nombreNegocio,
      telefono: negocio.telefono,
      email: negocio.email,
    );
    return negocioDataSource.addNegocio(negocioModel);
  }

  @override
  Stream<List<Negocio>> getNegocios() {
    return negocioDataSource.getNegocios().map((negocioModels) {
      return negocioModels
          .map((negocioModel) => Negocio(
                userId: negocioModel.userId,
                nombreNegocio: negocioModel.nombreNegocio,
                telefono: negocioModel.telefono,
                email: negocioModel.email,
              ))
          .toList();
    });
  }
}
