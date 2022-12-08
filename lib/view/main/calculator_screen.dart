import 'package:calculadora_base/model/constants.dart';
import 'package:calculadora_base/view/mecflu/arquimedes_screen.dart';
import 'package:calculadora_base/view/mecflu/darcy_weisbach_screen.dart';
import 'package:calculadora_base/view/mecflu/densidade_relativa_screen.dart';
import 'package:calculadora_base/view/mecflu/hazen_williams_screen.dart';
import 'package:calculadora_base/view/mecflu/massa_espec_screen.dart';
import 'package:calculadora_base/view/mecflu/moody_rouse_screen.dart';
import 'package:calculadora_base/view/mecflu/pascal_screen.dart';
import 'package:calculadora_base/view/mecflu/peso_espec_screen.dart';
import 'package:calculadora_base/view/mecflu/potencia_acionamento_bomba_screen.dart';
import 'package:calculadora_base/view/mecflu/pressao_screen.dart';
import 'package:calculadora_base/view/mecflu/reynolds_screen.dart';
import 'package:calculadora_base/view/mecflu/stevin_screen.dart';
import 'package:calculadora_base/view/mecflu/vazao_screen.dart';
import 'package:calculadora_base/view/mecflu/volume_espec_screen.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final int operationId;
  final int subject;

  const CalculatorScreen(this.operationId, this.subject, {super.key});

  @override
  createState() => _CalculatorScreenState(operationId, subject);
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  _CalculatorScreenState(this.operationId, this.subject);

  final int operationId;
  final int subject;

  @override
  Widget build(BuildContext context) {
    final operation = getOptions()
        .where((element) => element.id == operationId)
        .first;

    return Scaffold(
        appBar: AppBar(title: Text(operation.title)),
        body: SingleChildScrollView(
          child: buildOperationScreen(),
        ));
  }

  Widget buildOperationScreen() {
    switch (operationId) {
      case 1:
        return const MassaEspecScreen();
      case 2:
        return const VolumeEspecScreen();
      case 3:
        return const PesoEspecScreen();
      case 4:
        return const DensidadeRelativaScreen();
      case 5:
        return const VazaoScreen();
      case 6:
        return const PressaoScreen();
      case 7:
        return const ReynoldsScreen();
      case 8:
        return const MoodyRouseScreen();
      case 9:
        return const HazenWilliamsScreen();
      case 10:
        return const DarcyWeisbachScreen();
      case 11:
        return const StevinScreen();
      case 12:
        return const PascalScreen();
      case 13:
        return const ArquimedesScreen();
      case 14:
        return const PotenciaAcionamentoBombaScreen();
      default:
        return const Center(
          child: Text('Não implemementado!'),
        );
    }
  }

  List<Operacao> getOptions() {
    if (subject == 1) {
      return Constants.mecfluOptions;
    } else {
      return Constants.resmatOptions;
    }
  }
}
