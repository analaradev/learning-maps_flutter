import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Usuario {
  String nombre;
  String email;
  String password;

  Usuario({
    required this.nombre,
    required this.email,
    required this.password,
  });
}

class UsuarioAdapter extends TypeAdapter<Usuario> {
  @override
  final int typeId = 0;

  @override
  Usuario read(BinaryReader reader) {
    return Usuario(
      nombre: reader.readString(),
      email: reader.readString(),
      password: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Usuario obj) {
    writer.writeString(obj.nombre);
    writer.writeString(obj.email);
    writer.writeString(obj.password);
  }
}
