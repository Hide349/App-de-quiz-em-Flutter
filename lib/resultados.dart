import 'package:flutter/material.dart';

class Arguments {
  int acertos = 0;
  Arguments(this.acertos);
}

class Resultado extends StatelessWidget {
  const Resultado({Key? key}) : super(key: key);
  static const routeName = '/Resultado';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Arguments;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Resultado!',
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
                Text(
                  'Resultado!',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Você acertou \n ${arguments.acertos} de 10 \n perguntas',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Jogar Novamente!',
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15)),
                    onPressed: () {
                      print('Clicou em jogar novamente');
                      Navigator.pushNamed(context,'/');
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
