import 'package:appmapa/models/usuario_model.dart';
import 'package:hive/hive.dart';

class ComentarioController {
  Box comentariosBox = Hive.box('comentarios');

  void addComentario(String parque, Usuario usuario, String comentario) {
    String key =
        '$parque-${usuario.email}-${DateTime.now().millisecondsSinceEpoch}';
    comentariosBox.put(key, {
      'key': key,
      'parque': parque,
      'nombre': usuario.nombre,
      'email': usuario.email,
      'comentario': comentario,
    });
  }

  void removeComentario(String key) {
    comentariosBox.delete(key);
  }

  void removeAllComentarios() {
    comentariosBox.clear();
  }

  List<Map<dynamic, dynamic>> getComentariosByParque(String parque) {
    List<Map<dynamic, dynamic>> comentarios = [];

    for (var key in comentariosBox.keys) {
      if (key.toString().contains(parque)) {
        comentarios.add(comentariosBox.get(key));
      }
    }

    return comentarios;
  }

  List<Map<dynamic, dynamic>> getComentariosByUsuario(String email) {
    List<Map<dynamic, dynamic>> comentarios = [];

    for (var comentario in comentariosBox.values) {
      if (comentario['email'] == email) {
        comentarios.add(comentario);
      }
    }

    return comentarios;
  }

  bool isComentarioByUsuario(String key, String email) {
    Map<dynamic, dynamic> comentario = comentariosBox.get(key);

    return comentario['email'] == email;
  }
}
