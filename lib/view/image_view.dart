import 'package:appmapa/models/ubicacion_model.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final Ubicacion parque;
  const ImageView({super.key, required this.parque});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          // scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < parque.imagenes; i++)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 200,
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  'assets/${parque.nombre}/$i.jpg',
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
