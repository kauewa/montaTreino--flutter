import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:monta_treino/data/aluno.dart';
import 'package:monta_treino/service/interceptor.dart';

//métodos http para salvar dados do formato Aluno para Json e para ler dados do formato json para Aluno
class HttpService {
  static const String url = "http://192.168.1.9:3000/";
  static const String resource = "Alunos/";

  //Adicionando o interceptador no método Http
  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  //Local do banco
  getUrl() {
    return "$url$resource";
  }

  //local do aluno
  getUrlAluno(dynamic id) {
    return "$url$resource$id";
  }

  //Adicionando aluno no Json
  register(Aluno aluno) {
    //transformando o construtor aluno em String json.encode
    String dataAluno = json.encode(aluno.toMapSemTreino());

    //Adicionando no json
    client.post(Uri.parse(getUrl()),
        headers: {'Content-type': 'application/json'}, body: dataAluno);
  }

  //pegar os dados e  transformar no em uma lista de Alunos
  Future<List<Aluno>> getAll() async {
    //Resposta no formato json(String)
    http.Response resposta = await client.get(Uri.parse(getUrl()));

    if (resposta.statusCode != 200) {
      throw Exception();
    }

    List<Aluno> list = [];

    //transformando em lista dinamica
    List<dynamic> listDynamic = json.decode(resposta.body);

    //adiciona a lista de alunos
    for (var jsonMap in listDynamic) {
      list.add(Aluno.fromMap(jsonMap));
    }

    //retornando lista de alunos
    return list;
  }

  //pega aluno específico do banco
  Future<Aluno> getAluno(int index) async {
    List<Aluno> listAluno = await getAll();
    return listAluno[index];
  }

  //pega ultimo aluno do banco
  Future<Aluno> getLastAluno() async {
    List<Aluno> listAluno = await getAll();
    return listAluno.last;
  }

  //* incompleto
  incluirTreino(Aluno aluno) {
    String dataAluno = json.encode(aluno.toMapComTreino());

    client.patch(Uri.parse(getUrlAluno(aluno.id)),
        headers: {'Content-type': 'application/json'}, body: dataAluno);
  }
}
