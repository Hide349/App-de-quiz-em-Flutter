import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Space',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Quiz!',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Iniciar quiz',
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Quiz');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
