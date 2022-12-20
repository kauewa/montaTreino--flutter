

import 'package:flutter/material.dart';

Widget dia(String dia){
  return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                dia,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            );
}

Widget listaDeExec(List<Widget> list){
  return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Builder(
                builder: (context) {
                  List<Widget> listaFinal = list;
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listaFinal);
                }
              ),
            );
}