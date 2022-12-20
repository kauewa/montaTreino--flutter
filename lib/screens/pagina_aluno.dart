import 'package:flutter/material.dart';
import 'package:monta_treino/data/aluno.dart';
import 'package:monta_treino/screens/cria_treino.dart';
import 'package:monta_treino/service/httpservice.dart';

// Página do aluno que é gerada com o parametro aluno
//Nessa página poderemos criar o treino e acessa-lo
class PaginaAluno extends StatefulWidget {
  PaginaAluno({super.key, required this.aluno});

  Aluno aluno;

  @override
  State<PaginaAluno> createState() => _PaginaAlunoState();
}

class _PaginaAlunoState extends State<PaginaAluno> {
  HttpService service = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        iconTheme: IconThemeData(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${widget.aluno.nome}",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "${widget.aluno.idade}",
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
                onPressed: () {
                  service.incluirTreino(widget.aluno);
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CriaTreino()))
                      .then((value) => print(value));
                },
                child: Text("Criar Treino")),
          ],
        ),
      ),
    );
  }
}
