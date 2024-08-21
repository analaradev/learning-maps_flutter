import 'package:appmapa/controller/alimento_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Ubicacion {
  final String nombre;
  final double latitud;
  final double longitud;
  final double capacidad;
  final int imagenes;

  Ubicacion(
      this.nombre, this.latitud, this.longitud, this.capacidad, this.imagenes);

  LatLng get latLng => LatLng(latitud, longitud);

  double get alimento => AlimentoController().getAlimento(nombre);

  String addAlimento(double kilos) {
    return AlimentoController().addAlimento(nombre, kilos, capacidad);
  }

  String removeAlimento(double kilos) {
    return AlimentoController().removeAlimento(nombre, kilos);
  }

  String get porcentaje {
    //solo dos ceros despues del punto
    return ((alimento / capacidad) * 100).toStringAsFixed(2);
  }

  LatLng get center => LatLng(latitud - 0.0006, longitud);
}
