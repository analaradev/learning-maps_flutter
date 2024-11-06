import 'package:flutter/material.dart';

class CrearCamion extends StatefulWidget {
  const CrearCamion({Key? key}) : super(key: key);

  @override
  State<CrearCamion> createState() => _CrearCamionState();
}

class _CrearCamionState extends State<CrearCamion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear camión'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Nombre del camión:'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre del camión',
              ),
            ),
            const SizedBox(height: 20),
            //nombre del conductor
            const Text('Nombre del conductor:'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre del conductor',
              ),
            ),
            const SizedBox(height: 20),
            //id gps
            const Text('ID del GPS:'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID del GPS',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Capacidad del camión:'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Capacidad del camión',
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Crear camión'),
            ),
          ],
        ));
  }
}
