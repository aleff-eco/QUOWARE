import '../datasources/servicio_datasource.dart';
import '../models/servicio_model.dart';
import '../../domain/entities/servicio.dart';
import '../../domain/repositories/servicio_repository.dart';

class ServicioRepositoryImpl implements ServicioRepository {
  final ServicioDataSource servicioDataSource;

  ServicioRepositoryImpl({required this.servicioDataSource});

  @override
  Future<void> addServicio(Servicio servicio) {
    final servicioModel = ServicioModel(
      userId: servicio.userId,
      titulo: servicio.titulo,
      descripcion: servicio.descripcion,
      costo: servicio.costo,
      tiempo: servicio.tiempo,
    );
    return servicioDataSource.addServicio(servicioModel);
  }

  @override
  Stream<List<Servicio>> getServicios() {
    return servicioDataSource.getServicios().map((servicioModels) {
      return servicioModels
          .map((servicioModel) => Servicio(
                userId: servicioModel.userId,
                titulo: servicioModel.titulo,
                descripcion: servicioModel.descripcion,
                costo: servicioModel.costo,
                tiempo: servicioModel.tiempo,
              ))
          .toList();
    });
  }
}
