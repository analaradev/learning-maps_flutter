import 'dart:async';
import 'package:appmapa/models/ubicacion_model.dart';
import 'package:appmapa/view/comentarios_view.dart';
import 'package:appmapa/view/image_view.dart';

import 'package:appmapa/widgets/navigator_bar_widget.dart';
import 'package:appmapa/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:custom_marker/marker_icon.dart';

class MapSample extends StatefulWidget {
  final Ubicacion ubicacion;
  const MapSample({super.key, required this.ubicacion});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Marker? marker;

  Future<void> addMarker() async {
    marker = Marker(
      markerId: MarkerId(widget.ubicacion.nombre),
      position: widget.ubicacion.latLng,
      infoWindow: InfoWindow(
        title: widget.ubicacion.nombre,
      ),
      icon: await MarkerIcon.pictureAsset(
        assetPath: 'assets/marker.png',
        width: 100,
        height: 100,
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    addMarker(); // No esperamos el Future aquí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: {
              marker ?? const Marker(markerId: MarkerId('0')),
            },
            initialCameraPosition: CameraPosition(
              target: widget.ubicacion.center,
              zoom: 18.151926040649414,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          // navigationBar(),
          backButton(context),
          NavigatorBarWidget(
            widgets: [
              TextWidget(
                'Perfil del conductor',
                fontSize: 25,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          spreadRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person_4_sharp,
                      size: 40,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        'Nombre:',
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        'Pascual Perez',
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextWidget(
                'Informacion en tiempo real',
                fontSize: 25,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const TextWidget(
                    'Velocidad:',
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 10),
                  TextWidget(
                    '80 km/h',
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //maxilibramiento tampico 70D
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    'Ubicacion:',
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextWidget(
                      'Maxilibramiento Tampico',
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned backButton(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //boton para regresar
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 40,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  NavigatorBarWidget navigationBar() {
    return NavigatorBarWidget(
      widgets: [
        const SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.park_outlined,
              size: 40,
              color: Colors.green[800],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.ubicacion.nombre,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Row(
          children: [
            TextWidget("Alimento Restante\nPara Aves"),
            Spacer(),
            TextWidget("Total"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            TextWidget(
              "${widget.ubicacion.alimento} kg",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            TextWidget(
              "${widget.ubicacion.capacidad} kg",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: double.parse(widget.ubicacion.porcentaje) / 100,
          backgroundColor: Colors.green[200],
          valueColor: AlwaysStoppedAnimation<Color?>(Colors.green[800]),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                widget.ubicacion.removeAlimento(1);
                setState(() {});
              },
              icon: Icon(
                Icons.remove_circle_rounded,
                color: Colors.green[800],
                size: 40,
              ),
            ),
            TextWidget(
              '${widget.ubicacion.porcentaje} %',
              fontSize: 25,
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
            IconButton(
              onPressed: () {
                widget.ubicacion.addAlimento(1);
                setState(() {});
              },
              icon: Icon(
                Icons.add_circle_rounded,
                color: Colors.green[800],
                size: 40,
              ),
            ),
          ],
        ),
        TextWidget(
          "Imagenes",
          fontSize: 20,
          color: Colors.green[800],
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        ImageView(parque: widget.ubicacion),
        const SizedBox(height: 10),
        TextWidget(
          "Comentarios",
          fontSize: 20,
          color: Colors.green[800],
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        ComentariosView(parque: widget.ubicacion.nombre),
        const SizedBox(height: 40),
      ],
    );
  }
}
