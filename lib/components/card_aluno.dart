import 'package:flutter/material.dart';
import 'package:monta_treino/screens/pagina_aluno.dart';
import 'package:monta_treino/service/httpservice.dart';

import '../data/aluno.dart';

//Card do aluno que aparece na página inicial
//Recebe os dados do aluno para ux
class CardAluno extends StatelessWidget {
  CardAluno(
      {super.key,
      required this.nome,
      required this.idade,
      required this.index});

  String nome;
  String idade;
  int index;
  HttpService service = HttpService();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Aluno pegaAluno = await service.getAluno(index);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextnew) => PaginaAluno(aluno: pegaAluno)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.lightBlue[600],
          ),
          width: 370,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$nome",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text("$idade Anos"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
