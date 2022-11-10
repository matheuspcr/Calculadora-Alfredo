import 'package:calculadora_base/view/arquimedes_screen.dart';
import 'package:calculadora_base/view/darcy_weisbach_screen.dart';
import 'package:calculadora_base/view/densidade_relativa_screen.dart';
import 'package:calculadora_base/view/hazen_williams_screen.dart';
import 'package:calculadora_base/view/massa_espec_screen.dart';
import 'package:calculadora_base/view/pascal_screen.dart';
import 'package:calculadora_base/view/peso_espec_screen.dart';
import 'package:calculadora_base/view/pressao_screen.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:calculadora_base/view/stevin_screen.dart';
import 'package:calculadora_base/view/volume_espec_screen.dart';
import 'package:flutter/material.dart';

import '../moody_rouse_screen.dart';
import '../reynolds_screen.dart';
import '../vazao_screen.dart';

class CalculatorScreen extends StatefulWidget {
  final int operationId;

  const CalculatorScreen(this.operationId, {super.key});

  @override
  createState() => _CalculatorScreenState(operationId);
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  _CalculatorScreenState(this.operationId);

  final int operationId;

  @override
  Widget build(BuildContext context) {
    final operation = Constants.mainPageOptions
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
      default:
        return const Center(
          child: Text('Não implemementado!'),
        );
    }
  }
}
