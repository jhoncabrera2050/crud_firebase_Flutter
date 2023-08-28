import 'package:cloud_firestore/cloud_firestore.dart';

// Otras importaciones y código...

// Función para eliminar una película por su UID
Future<void> deleteMovie(String uid) async {
  try {
    await FirebaseFirestore.instance.collection("Peliculas").doc(uid).delete();
    // Éxito al eliminar la película
  } catch (e) {
    // Manejo de errores, si es necesario
    print("Error al eliminar la película: $e");
  }
}