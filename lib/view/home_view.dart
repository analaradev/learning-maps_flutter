import 'package:appmapa/const/ubicaciones.dart';
import 'package:appmapa/models/ubicacion_model.dart';
import 'package:appmapa/view/crear_camion.dart';
import 'package:appmapa/view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.directions_bus_rounded,
          // color: Colors.white,
          size: 30,
        ),
        leadingWidth: 80,
        title: const Text(
          'Vehículos',
          style: TextStyle(
            fontSize: 30,
            // color: Colors.white,
            // color: Color(0xFF403c54),
          ),
        ),
        // backgroundColor: const Color(0xFF403c54),
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cerrar sesión'),
                  content:
                      const Text('¿Está seguro de que desea cerrar sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Salir'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
              // color: Colors.white,
              // color: Color(0xFF403c54),
              size: 30,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          //imagen desde assets
          Image.asset(
            'assets/home/park.png',
            // height: 200,
            // width: double.infinity,
            fit: BoxFit.fill,
          ),
          // const SizedBox(height: 10),
          for (Ubicacion ubicacion in ubicaciones)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapSample(ubicacion: ubicacion),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.directions_bus_filled_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        ubicacion.nombre,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text(
                    //       'Alimento',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 15,
                    //       ),
                    //     ),
                    //     Text(
                    //       '${ubicacion.porcentaje}%',
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 25,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(width: 10),
                    // Icon(
                    //   double.parse(ubicacion.porcentaje) < 30
                    //       ? Icons.sentiment_dissatisfied_rounded
                    //       : double.parse(ubicacion.porcentaje) < 70
                    //           ? Icons.sentiment_satisfied_alt_rounded
                    //           : Icons.sentiment_very_satisfied_rounded,
                    //   color: Colors.white,
                    //   size: 30,
                    // ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CrearCamion(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
