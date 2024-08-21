import 'package:appmapa/controller/usuario_controller.dart';
import 'package:appmapa/view/home_view.dart';
import 'package:appmapa/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CrearCuentaView extends StatefulWidget {
  const CrearCuentaView({super.key});

  @override
  State<CrearCuentaView> createState() => _CrearCuentaViewState();
}

class _CrearCuentaViewState extends State<CrearCuentaView> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                'Crear cuenta',
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String mensaje = UsuarioController().createUser(
                    nombreController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  if (mensaje == 'Usuario creado') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(mensaje),
                    ),
                  );
                },
                child: const Text('Crear cuenta'),
              ),
              const SizedBox(height: 10),
              const Text('¿Ya tienes cuenta?'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
