import 'package:flutter/material.dart';
import 'package:monta_treino/screens/cadastro_aluno.dart';
import 'package:monta_treino/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        shadowColor: Colors.blue,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: const TextStyle(color: Colors.white),
            shadowColor: Colors.lightBlue[600]),
        primaryColor: Colors.white70,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        "home": (context) => const InitialScreen(),
        "cadastro": (context) => CadastroAluno(contextCadastro: context),
      },
    );
  }
}
