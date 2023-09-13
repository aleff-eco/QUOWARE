import '../entities/servicio.dart';
import '../repositories/servicio_repository.dart';

class ServicioUseCase {
  final ServicioRepository servicioRepository;

  ServicioUseCase({required this.servicioRepository});

  Future<void> addServicio(Servicio servicio) {
    return servicioRepository.addServicio(servicio);
  }

  Stream<List<Servicio>> getServicios() {
    return servicioRepository.getServicios();
  }
}
