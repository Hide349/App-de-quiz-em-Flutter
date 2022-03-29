import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';
import 'quiz_dados.dart';

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    //quiz.shuffle();

    quiz.forEach((element) {
      int alternativaCorreta = element['Alternativa_correta'];
      List respostas = element['respostas'];

      String respostaCorreta = element['respostas'][alternativaCorreta - 1];
      respostas.shuffle();

      int i = 1;
      respostas.forEach((element) {
        if (element == respostaCorreta) {
          alternativaCorreta = i;
        } 
        i++;
      });
     element['Alternativa_correta'] = alternativaCorreta;

    });

    /*
    quiz.add({
      "pergunta": "O flutter é:",
      "respostas": [
        "Uma linguagem",
        "Um aplicativo",
        "Um SDK",
        "Um notebook",
      ],
      "Alternativa_correta": 3,
    });

    for (int i = 3; i <= 20; i++) {
      quiz.add({
        "pergunta": "Pergunta $i",
        "respostas": [
          "Resposta 1",
          "Resposta 2",
          "Resposta 3",
          "Resposta 4",
        ],
        "Alternativa_correta": 1,
      });
    }

    print('Dados do quiz');
    print(quiz);
    */
    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['Alternativa_correta'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          erros++;
        }
        print('Acertos totais: $acertos, erros totais : $erros');
      });
      if (perguntaNumero == 10) {
        print('terminou o quiz!');
        Navigator.pushNamed(context, '/Resultado',
            arguments: Arguments(acertos));
      } else {
        perguntaNumero++;
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Quiz'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Pergunta ${perguntaNumero} de 10: ',
                      style: TextStyle(fontSize: 20),
                    )),
                Text(
                  '${quiz[perguntaNumero - 1]['pergunta']}',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][0],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(90, 25, 90, 25),
                    ),
                    onPressed: () {
                      respondeu(1);
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][1],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(90, 25, 90, 25),
                    ),
                    onPressed: () {
                      respondeu(2);
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][2],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(90, 25, 90, 25),
                    ),
                    onPressed: () {
                      respondeu(3);
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][3],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(90, 25, 90, 25),
                    ),
                    onPressed: () {
                      respondeu(4);
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
