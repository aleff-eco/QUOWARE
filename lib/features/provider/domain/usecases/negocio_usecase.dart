import '../entities/negocio.dart';
import '../repositories/negocio_repository.dart';

class NegocioUseCase {
  final NegocioRepository negocioRepository;

  NegocioUseCase({required this.negocioRepository});

  Future<void> addNegocio(Negocio negocio) {
    return negocioRepository.addNegocio(negocio);
  }

  Stream<List<Negocio>> getNegocios() {
    return negocioRepository.getNegocios();
  }
}
