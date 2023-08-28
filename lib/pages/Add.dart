import 'package:crud_firebase/services/service_firebase.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Ingrese la nueva pelicula',
            ),
          ),
          ElevatedButton(onPressed: () async {
            await addMovie(titleController.text).then((_) {
              Navigator.pop(context);
            });

          }, child: const Text("Guardar"))
        ]),
      ),
    );
  }
}