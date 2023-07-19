import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/screens/drag_teste.dart';
import 'presentation/screens/hive_teste.dart';

//import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: DragScreen()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo hive',
      home: FutureBuilder(
        future: _abrirCaixa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return const Scaffold(
                body: Center(
                  child: Text('Algo deu errado :('),
                ),
              );
            } else {
              return const MinhaPagina();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<Box> _abrirCaixa() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  print("diretório -> ${dir.path}");
  return await Hive.openBox('minhaCaixa');
}
