import 'package:flutter/material.dart';
import 'package:monta_treino/data/aluno.dart';
import 'package:monta_treino/screens/pagina_aluno.dart';
import 'package:monta_treino/service/httpservice.dart';

//Pagina para cadastra aluno novo
class CadastroAluno extends StatefulWidget {
  CadastroAluno({super.key, required this.contextCadastro});

  final BuildContext contextCadastro;

  @override
  State<CadastroAluno> createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  //serviço com funções http
  HttpService service = HttpService();

  //controllers das caixas de texto dos formulários
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtIdade = TextEditingController();

  String? genero;

  int color = 0;

  //chave de validação do form
  final _formKey = GlobalKey<FormState>();

  //função de verificação para caixa de texto no form
  bool valueValidator(String value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  //função para passar dado dos botoes masculino/feminino
  void botao(x) {
    switch (x) {
      case 0:
        genero = "F";
        break;
      default:
        genero = "M";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: Text(
            "Novo Aluno",
            style: TextStyle(fontSize: 24),
          ),
          iconTheme: IconThemeData(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //caixa de texto nome
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: txtNome,
                validator: (value) {
                  if (valueValidator(value!)) {
                    return "Insira o seu nome";
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: "Nome",
                    labelText: 'Nome *',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.blue)),
                style: TextStyle(color: Colors.white),
              ),
            ),

            //caixa de texto idade
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: txtIdade,
                validator: (value) {
                  if (valueValidator(value!)) {
                    return "Insira a sua idade";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: "Idade",
                    labelText: 'Idade *',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.blue)),
                style: TextStyle(color: Colors.white),
              ),
            ),

            //escolha de masculino/feminino
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = 1;
                    });
                    botao(1);
                  },
                  child: Text("Masculino"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        color == 1 ? Colors.indigo[900] : Colors.lightBlue,
                    elevation: color == 1 ? 10 : 0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = 2;
                    });
                    botao(0);
                  },
                  child: Text("Feminino"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        color == 2 ? Colors.indigo[900] : Colors.blue,
                    elevation: color == 2 ? 10 : 0,
                  ),
                ),
              ],
            ),

            //botao para validar tudo e cadastrar
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate() && genero != null) {
                  Aluno aluno = Aluno(
                      nome: txtNome.text,
                      idade: txtIdade.text,
                      genero: genero!);

                  service.register(aluno);

                  Aluno dataAluno = await service.getLastAluno();

                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PaginaAluno(aluno: dataAluno)))
                      .then((value) => Navigator.pop(context));
                }
              },
              child: Text("Cadastrar"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[900],
                  fixedSize: Size(200, 70),
                  elevation: 10,
                  shadowColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
