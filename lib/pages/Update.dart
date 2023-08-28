import 'package:crud_firebase/services/service_firebase.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    titleController.text = arguments['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Película'),
        backgroundColor: Colors.blue, // Cambiamos el color de fondo de la AppBar
        centerTitle: true, // Centramos el título en la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Aumentamos el espacio alrededor del contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centramos el contenido verticalmente
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título de la película',
                border: OutlineInputBorder(),
                hintText: 'Ingresa el nuevo título',
              ),
              style: TextStyle(fontSize: 18), // Aumentamos el tamaño de fuente del TextField
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await updateMovie(arguments['uid'], titleController.text)
                    .then((_) {
                  Navigator.pop(context);
                });
              },
              child: Text("Actualizar"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Cambiamos el color de fondo del botón
                onPrimary: Colors.white, // Cambiamos el color del texto del botón
                textStyle: TextStyle(fontSize: 20), // Aumentamos el tamaño de fuente del botón
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Aumentamos el espacio interno del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
