import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';

import 'view/list/calculator_screen.dart';

void main() {
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora MecFlu',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(Constants.mainPageOptions.length, (index) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: getRow(Constants.mainPageOptions[index])),
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
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.indigoAccent
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen(operationId)));
  }
}
