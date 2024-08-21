import 'package:appmapa/models/usuario_model.dart';
import 'package:hive/hive.dart';

class UsuarioController {
  static final UsuarioController _instancia = UsuarioController._();

  factory UsuarioController() {
    return _instancia;
  }

  UsuarioController._();

  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  void setUsuario(Usuario usuario) {
    _usuario = usuario;
  }

  void removeUsuario() {
    _usuario = null;
  }

  String login(String email, String password) {
    Box<Usuario> usuarios = Hive.box<Usuario>('usuarios');

    Usuario? user = usuarios.get(email);

    if (user == null) {
      return 'Usuario no encontrado';
    } else if (user.password != password) {
      return 'Contraseña incorrecta';
    } else {
      _usuario = user;
      return 'Login exitoso';
    }
  }

  String createUser(String nombre, String email, String password) {
    Box<Usuario> usuarios = Hive.box<Usuario>('usuarios');

    if (usuarios.containsKey(email)) {
      return 'El email ya está registrado';
    } else {
      usuarios.put(
        email,
        Usuario(nombre: nombre, email: email, password: password),
      );

      _usuario = usuarios.get(email);

      return 'Usuario creado';
    }
  }
}
