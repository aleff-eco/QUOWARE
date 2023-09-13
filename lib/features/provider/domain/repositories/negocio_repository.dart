import '../entities/negocio.dart';

abstract class NegocioRepository {
  Future<void> addNegocio(Negocio negocio);
  Stream<List<Negocio>> getNegocios();
}
