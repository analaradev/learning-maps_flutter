import 'package:appmapa/models/usuario_model.dart';
import 'package:appmapa/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}

initializeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UsuarioAdapter());
  await Hive.openBox<Usuario>('usuarios');

  await Hive.openBox('comentarios');

  await Hive.openBox('values');

  await Hive.openBox('parque');
}
