import 'package:flutter/material.dart';
import 'package:isaac_app/widgets/main_page.dart';

class MinhaPagina extends StatelessWidget {
  // ou StatefulWidget
  const MinhaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hive'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Usando o contexto armazenado na variável
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppHome()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  // Defina o código da sua página aqui
}
