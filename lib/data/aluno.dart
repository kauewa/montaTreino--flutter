//classe do aluno

class Aluno {
  String nome;
  String idade;
  String genero;
  dynamic id;

  Map<String, List<String>> periodiazacao = {
    "Segunda": [],
    "Terça": [],
    "Quarta": [],
    "Quinta": [],
    "Sexta": [],
    "Sábado": [],
    "Domingo": [],
  };

  //construtor para cadastro
  Aluno({required this.nome, required this.idade, required this.genero});

  //contrutor do dado que veio do banco
  Aluno.fromMap(Map<String, dynamic> map)
      : nome = map["Nome"],
        idade = map["idade"],
        genero = map["genero"],
        id = map["id"];

  //transformando aluno em dado legivel para o banco
  Map<String, dynamic> toMapSemTreino() {
    return {"Nome": nome, "idade": idade, "genero": genero, "Periodizacao": {}};
  }

  //*Mudar
  Map<String, dynamic> toMapComTreino() {
    return {
      "Nome": nome,
      "idade": idade,
      "genero": genero,
      "Periodizacao": periodiazacao
    };
  }

  //busca exercicio
  String exercicio(List<String> musculo, int index) {
    return musculo[index];
  }

  //Montador do treino
  montaTreino(
      List<String> segunda,
      List<String> terca,
      List<String> quarta,
      List<String> quinta,
      List<String> sexta,
      List<String> sabado,
      List<String> domingo) {
    Map<String, List<String>> periodiazacao = {
      "Segunda": segunda,
      "Terça": terca,
      "Quarta": quarta,
      "Quinta": quinta,
      "Sexta": sexta,
      "Sábado": sabado,
      "Domingo": domingo,
    };
  }

  List<String> peito = [
    "Supino Reto/Barra",
    "Supino Inclinado/Barra",
    "Supino Reto/Halter",
    "Supino Inclinado/Halter"
  ];
  List<String> costas = [
    "Supino Reto/Barra",
    "Supino Inclinado/Barra",
    "Supino Reto/Halter",
    "Supino Inclinado/Halter"
  ];
  List<String> ombro = [
    "Elevação lateral",
    "Elevação frontal",
    "Desenvolvimento livre"
  ];
  List<String> biceps = [
    "Rosca direta/alternado",
    "Barra W",
    "Rosca com apoio"
  ];
  List<String> triceps = ["Triceps corda", "Frances", "Triceps triangulo"];
  List<String> quadriceps = ["Agachamento livre", "Hack", "Extensora"];
  List<String> posteriorCoxa = ["Flexora sentada", "Flexora deitada", "Stiff"];
  List<String> panturrilha = ["Panturrilha sentada", "Panturrilha em pé"];
  List<String> abdomen = ["Padrão", "Máquina"];
  List<String> antebraco = ["Flexores", "Extensores"];
}
