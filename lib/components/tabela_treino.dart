import 'package:flutter/material.dart';
import 'package:monta_treino/components/EscolhaExec.dart';
import 'package:monta_treino/data/periodizacao.dart';

class CardTabelaTreino extends StatefulWidget {
  CardTabelaTreino({
    required this.musculo,
    super.key,
  });
  String musculo;

  //treino
  @override
  State<CardTabelaTreino> createState() => _CardTabelaTreinoState();
}

Periodizacao periodizacao = Periodizacao();

class _CardTabelaTreinoState extends State<CardTabelaTreino> {
  List itens = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(style: BorderStyle.solid, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () async {
                final exec = await EscolhaExec(context, widget.musculo);

                if (itens.contains(exec)) {
                  print('Ja contém esse exercicio');
                } else {
                  setState(() {
                    itens.add(exec);
                  });
                }
              },
              child: Icon(Icons.add),
            ),
          ),
          ReorderableListView(
            shrinkWrap: true,
            header: Text(
              widget.musculo,
              textAlign: TextAlign.center,
            ),
            onReorder: ((oldIndex, newIndex) {
              // setState(() {
              //   if (newIndex > oldIndex) newIndex--;
              //   final item = itens.removeAt(oldIndex);
              //   itens.insert(newIndex, item);
              // });
            }),
            children: [
              for (final item in itens)
                ListTile(
                  key: ValueKey(item),
                  title: Text(
                    item,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
