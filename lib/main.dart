import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/Quiz':(context) => Quiz(),
        Resultado.routeName:(context) => Resultado(),
      },
    );
  }
}




