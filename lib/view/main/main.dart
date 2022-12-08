import 'package:calculadora_base/model/constants.dart';
import 'package:calculadora_base/view/list/list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const HomePage(title: 'Home'),
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
  final options = <Operacao>[Operacao(1, 'Mecânica dos fluídos'), Operacao(2, 'Resistência dos materiais')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(options.length, (index) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: getRow(options[index])),
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
        navigateToDetail(option);
      },
    );
  }

  void navigateToDetail(Operacao subject) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen(subject)));
  }
}
