import 'package:flutter/material.dart';
import 'package:monta_treino/components/card_aluno.dart';
import 'package:monta_treino/data/aluno.dart';
import 'package:monta_treino/screens/cadastro_aluno.dart';
import 'package:monta_treino/service/httpservice.dart';

//tela inicial

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  HttpService service = HttpService();

  //função que pega a lista de alunos do banco de dados e transforma em uma lista de cards para aparecer na tela
  Future<List<CardAluno>> alunoToWidget() async {
    List<Aluno> listAluno = await service.getAll();
    List<CardAluno> listWigetAluno = [];
    for (Aluno aluno in listAluno) {
      listWigetAluno.add(CardAluno(
        nome: aluno.nome,
        idade: aluno.idade,
        index: listAluno.indexOf(aluno),
      ));
    }
    return listWigetAluno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text(
          "Alunos",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {
                refresh();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),

      //builder para mostrar a lista de alunos na tela
      body: FutureBuilder<List<CardAluno>>(
        future: alunoToWidget(),
        builder: ((context, snapshot) {
          List<CardAluno>? item = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Column(
                  children: [CircularProgressIndicator(), Text('Carregando')],
                ),
              );
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [CircularProgressIndicator(), Text('Carregando')],
                ),
              );
              break;
            case ConnectionState.active:
              return Center(
                child: Column(
                  children: [CircularProgressIndicator(), Text('Carregando')],
                ),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasData && item != null) {
                if (item.isNotEmpty) {
                  return ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        final CardAluno aluno = item[index];
                        return aluno;
                      });
                }
                return Center(
                  child: Column(
                    children: [
                      Text(
                        'Não há nenhum aluno',
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ],
                  ),
                );
              }
              return Text('Erro ao carregar tarefas');
              break;
          }
        }),
      ),

      //botao para adicionar um aluno novo
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contextnew) =>
                          CadastroAluno(contextCadastro: context)))
              .then((value) => refresh());
        },
        label: Icon(Icons.add_outlined),
        backgroundColor: Colors.blue[800],
      ),
    );
  }

  //função para atualizar pagina
  void refresh() async {
    setState(() {});
  }
}
