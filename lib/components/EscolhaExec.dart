import 'package:flutter/material.dart';
import 'package:monta_treino/data/periodizacao.dart';

EscolhaExec(BuildContext context, String musc) {
  Periodizacao periodizacao = Periodizacao();
  String musculo = musc;
  String exec = '';
  List<Widget> listaExec = [];

  periodizacao.musculos.forEach((key, value) {
    if (key == musculo) {
      value.forEach((element) {
        listaExec.add(ElevatedButton(
            onPressed: () {
              exec = element;
            },
            child: Text(element)));
      });
    }
  });
  Axis axis = Axis.vertical;
  ScrollController controller = ScrollController();

  AlertDialog alerta = AlertDialog(
    title: Text("Escolha um exercicio"),
    content: SizedBox(
      width: 70,
      child: ListView(
        controller: controller,
        scrollDirection: axis,
        children: listaExec,
      ),
    ),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context, exec);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text("OK")),
    ],
  );

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      }).then((value) => value);
}
