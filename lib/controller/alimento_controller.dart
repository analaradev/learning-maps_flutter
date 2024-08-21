import 'package:hive/hive.dart';

class AlimentoController {
  final Box _box = Hive.box('parque');

  String addAlimento(String parque, double kilos, double capacidad) {
    double aux = _box.get(parque, defaultValue: 0.0);
    if (aux + kilos > capacidad) {
      return 'No hay suficiente espacio';
    }
    _box.put(parque, aux + kilos);
    return 'Alimento agregado';
  }

  double getAlimento(String parque) {
    return _box.get(parque, defaultValue: 0.0);
  }

  String removeAlimento(String parque, double kilos) {
    double aux = _box.get(parque, defaultValue: 0.0);
    if (aux - kilos < 0) {
      return 'No hay suficiente alimento';
    }
    _box.put(parque, aux - kilos);
    return 'Alimento retirado';
  }
}
