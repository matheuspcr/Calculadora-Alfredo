import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';

import '../main/calculator_screen.dart';

class ListScreen extends StatefulWidget {
  final Operacao subject;

  const ListScreen(this.subject, {super.key});

  @override
  createState() => _ListScreenState(subject);
}

class _ListScreenState extends State<ListScreen> {
  _ListScreenState(this.subject);
  final Operacao subject;

  @override
  Widget build(BuildContext context) {
    final list = getOptions();

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(list.length, (index) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: getRow(list[index])),
          );
        }),
      ),
    );
  }

  Widget getRow(Operacao option) {
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.black54),
                color: Colors.white70
            ),
            child: Center(
              child: Padding(padding: const EdgeInsets.all(10), child: Text(option.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5,)),
            ),
          )
      ),
      onTap: () {
        navigateToDetail(option.id);
      },
    );
  }

  void navigateToDetail(int operationId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen(operationId, subject.id)));
  }

  List<Operacao> getOptions() {
    if (subject.id == 1) {
      return Constants.mecfluOptions;
    } else {
      return Constants.resmatOptions;
    }
  }
}
