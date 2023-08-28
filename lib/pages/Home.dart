import 'package:crud_firebase/pages/Delete.dart';
import 'package:crud_firebase/services/service_firebase.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Peliculas'),
      ),
      body: FutureBuilder(
        future: getMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos elementos por fila
              ),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.pushNamed(context, "/update", arguments: {
                        "title": snapshot.data?[index]['title'],
                        "uid": snapshot.data?[index]['uid'],
                      });
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.movie,
                          size: 60,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 8),
                        Text(
                          snapshot.data?[index]['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await deleteMovie(snapshot.data?[index]['uid']);
                            setState(() {
                              snapshot.data?.removeAt(index);
                            });
                          },
                          child: Text("Eliminar"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // Cambiar el color del botón a rojo
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
