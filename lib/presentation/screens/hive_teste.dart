import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MinhaPagina extends StatefulWidget {
  const MinhaPagina({super.key});

  @override
  _MinhaPaginaState createState() => _MinhaPaginaState();
}

class _MinhaPaginaState extends State<MinhaPagina> {
  late Box _caixa;
  @override
  void initState() {
    _caixa = Hive.box('minhaCaixa');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo hive'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Reinicie o aplicativo para testar'),
            const SizedBox(height: 8),
            const Text('You have pushed the button this many times:'),
            ValueListenableBuilder(
              valueListenable: _caixa.listenable(),
              builder: (context, box, widget) {
                return Text(
                  box.get('contador', defaultValue: 0).toString(),
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _caixa.put('contador', _caixa.get('contador', defaultValue: 0) + 1);
        },
        tooltip: 'Aumentar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
