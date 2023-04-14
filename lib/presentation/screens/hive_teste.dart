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

  static const _boxName = 'aluno_box';

  Future<Box> _getBox() async {
    if (Hive.isBoxOpen('minhaCaixa')) {
      return Hive.box('minhaCaixa');
    }
    return await Hive.openBox<String>(_boxName);
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('minhaCaixa');
    box.put('name', 'David');
    box.put('age', '18');
    box.delete('contador');
    var values = box.values;
    var keys = box.keys;

    var name = box.get('name');
    var age = box.get('age');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo hive'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Values: ${values}\nKeys: ${keys}\nName:${name}\nAge:${age}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
