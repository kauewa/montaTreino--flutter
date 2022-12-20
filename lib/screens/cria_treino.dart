import 'package:flutter/material.dart';
import 'package:monta_treino/components/escolhaMusculo.dart';
import 'package:monta_treino/components/tabela_treino.dart';

import '../components/componentstreino.dart';

//Página montadora de treino
class CriaTreino extends StatefulWidget {
  CriaTreino({
    super.key,
  });

  @override
  State<CriaTreino> createState() => _CriaTreinoState();
}

class _CriaTreinoState extends State<CriaTreino> {
  //variável para controle ux
  Axis axis = Axis.vertical;
  ScrollController controller = ScrollController();

  //quantidade listas de musculos abertos para cada dia
  List<Widget> segunda = [];
  List<Widget> terca = [];
  List<Widget> quarta = [];
  List<Widget> quinta = [];
  List<Widget> sexta = [];
  List<Widget> sabado = [];
  List<Widget> domingo = [];

  Map<String, List<String>> retornoDB = {
    "Segunda": [],
    "Terça": [],
    "Quarta": [],
    "Quinta": [],
    "Sexta": [],
    "Sábado": [],
    "Domingo": [],
  };

  void adicionaRetornoDB() {
    segunda.forEach((element) {
      print(element.key.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body: ListView(
          controller: controller,
          shrinkWrap: true,
          scrollDirection: axis,
          children: [
            dia('Segunda'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (segunda.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        segunda.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(segunda),
            dia('Terça'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (terca.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        terca.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(terca),
            dia('Quarta'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (quarta.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        quarta.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(quarta),
            dia('Quinta'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (quinta.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        quinta.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(quinta),
            dia('Sexta'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (sexta.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        sexta.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(sexta),
            dia('Sábado'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (sabado.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        sabado.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(sabado),
            dia('Domingo'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (domingo.length < 3) {
                      final alerta = await EscolhaMusculo(context);
                      print(alerta);
                      setState(() {
                        domingo.add(CardTabelaTreino(musculo: alerta));
                      });
                    }
                  },
                  child: Text('Adicionar')),
            ),
            listaDeExec(domingo),
            ElevatedButton(
                onPressed: () {
                  adicionaRetornoDB();

                  // setState(() {

                  //   segunda = [];
                  //   terca = [];
                  //   quarta = [];
                  //   quinta = [];
                  //   sexta = [];
                  //   sabado = [];
                  //   domingo = [];

                  // });
                  // Navigator.pop(context);
                },
                child: Text('Concluir Treino'))
          ],
        ));
  }
}
