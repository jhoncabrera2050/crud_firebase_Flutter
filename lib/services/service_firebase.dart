// funcion para crear leer
import 'package:cloud_firestore/cloud_firestore.dart';
//creamos una instancia
FirebaseFirestore DB = FirebaseFirestore.instance;
//funcion que nos regrese una lista strings
Future<List> getMovie() async{
  List movie = [];
  //creando una referencia para la coleccion
  CollectionReference collectionReferenceMovie = DB.collection('Peliculas');
  // realizar la consulta
  QuerySnapshot queryMovie = await collectionReferenceMovie.get();
  for(var doc in queryMovie.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final moviedos = {
      "title" : data['title'],
      "uid" : doc.id,
    };
    movie.add(moviedos); 
   }
  return movie;
}
// funcion para guardar en la bd
Future<void> addMovie(String movie) async{
  await DB.collection("Peliculas").add({"title" : movie });
}

// funcion para actualizar la pelicula en DB
Future<void> updateMovie(String uid, String newTitle) async {
  await DB.collection("Peliculas").doc(uid).set({"title": newTitle});
}
