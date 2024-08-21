import 'package:appmapa/controller/comentarios_controller.dart';
import 'package:appmapa/controller/usuario_controller.dart';
import 'package:flutter/material.dart';

class ComentariosView extends StatefulWidget {
  final String parque;
  const ComentariosView({super.key, required this.parque});

  @override
  State<ComentariosView> createState() => _ComentariosViewState();
}

class _ComentariosViewState extends State<ComentariosView> {
  TextEditingController comentarioController = TextEditingController();

  ComentarioController controller = ComentarioController();
  UsuarioController usuarioController = UsuarioController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              size: 40,
              color: Colors.green[800],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: comentarioController,
                decoration: const InputDecoration(
                  hintText: 'Escribe un comentario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (comentarioController.text.isNotEmpty) {
                  controller.addComentario(
                    widget.parque,
                    usuarioController.usuario!,
                    comentarioController.text,
                  );
                  comentarioController.clear();
                  setState(() {});
                }
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        const SizedBox(height: 20),
        for (var comentario in controller.getComentariosByParque(widget.parque))
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.green[800],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${comentario['nombre']} ${controller.isComentarioByUsuario(
                          comentario['key'],
                          usuarioController.usuario!.email,
                        ) ? '(Tú)' : ''}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        comentario['comentario'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                controller.isComentarioByUsuario(
                  comentario['key'],
                  usuarioController.usuario!.email,
                )
                    ? IconButton(
                        onPressed: () {
                          //estas seguro de eliminar el comentario?
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Eliminar comentario'),
                                content: const Text(
                                    '¿Estás seguro de eliminar el comentario?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller
                                          .removeComentario(comentario['key']);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: const Text('Eliminar'),
                                  ),
                                ],
                              );
                            },
                          );

                          // controller.removeComentario(comentario['key']);
                          // setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
      ],
    );
  }
}
