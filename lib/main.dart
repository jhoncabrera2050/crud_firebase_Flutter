import 'package:crud_firebase/pages/Add.dart';
import 'package:crud_firebase/pages/Home.dart';
import 'package:crud_firebase/pages/Update.dart';
import 'package:flutter/material.dart';


// importaciondes de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title : 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddPage(),
        '/update': (context) => const UpdatePage(),
      },
    );
  }
}

