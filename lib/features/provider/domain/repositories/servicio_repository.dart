import '../entities/servicio.dart';

abstract class ServicioRepository {
  Future<void> addServicio(Servicio servicio);
  Stream<List<Servicio>> getServicios();
}
