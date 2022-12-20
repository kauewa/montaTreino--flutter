import 'package:flutter/material.dart';
import 'package:monta_treino/data/periodizacao.dart';

EscolhaMusculo(BuildContext context) {
  Periodizacao periodizacao = Periodizacao();
  String musculo = '';
  List<Widget> musculos = [];
  periodizacao.musculos.keys.forEach((element) {
    musculos.add(ElevatedButton(
        onPressed: () {
          musculo = element;
        },
        child: Text(element)));
  });
  Axis axis = Axis.vertical;
  ScrollController controller = ScrollController();

  AlertDialog alerta = AlertDialog(
    title: Text("Escolha um músculo"),
    content: SizedBox(
      width: 70,
      child: ListView(
        controller: controller,
        scrollDirection: axis,
        children: musculos,
      ),
    ),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context, musculo);
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
