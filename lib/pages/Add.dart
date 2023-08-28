import 'package:flutter/material.dart';
import 'package:crud_firebase/services/service_firebase.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController titleController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Película'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el título de la película',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Verificar si el campo de texto está vacío
                if (titleController.text.trim().isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("El título de la película no puede estar vacío."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Aceptar"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Si el campo de texto no está vacío, agregar la película
                  await addMovie(titleController.text).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
              child: const Text("Guardar"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
