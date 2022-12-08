import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';

import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class MoodyRouseScreen extends StatefulWidget {
  const MoodyRouseScreen({super.key});

  @override
  State<MoodyRouseScreen> createState() => _MoodyRouseScreenState();
}

class _MoodyRouseScreenState extends State<MoodyRouseScreen> {
  final TextEditingController _coefAtritoController = TextEditingController();
  final TextEditingController _comprimentoTuboController =
      TextEditingController();
  final TextEditingController _diametroTuboController = TextEditingController();
  final TextEditingController _velocidadeController = TextEditingController();
  final TextEditingController _gravidadeController = TextEditingController();
  final TextEditingController _perdaCargaDistribuidaController =
      TextEditingController();

  Unit _comprimentoTuboDV = Constants.distancia.first;
  Unit _diametroTuboDV = Constants.distancia.first;
  Unit _velocidadeDV = Constants.velocidade.first;
  Unit _gravidadeDV = Constants.aceleracao.first;
  Unit _perdaCargaDistribuidaDV = Constants.distancia.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputFieldWithoutDropdown(
                _coefAtritoController, 'Coeficiente de atritio(f):', true),
            getDefaultInputField(
                _comprimentoTuboController,
                'Comprimento da tubulação(L):',
                true,
                Constants.distancia,
                _comprimentoTuboDV,
                (value) => {
                      setState(() {
                        _comprimentoTuboDV = value!;
                      })
                    }),
            getDefaultInputField(
                _diametroTuboController,
                'Diametro da tubulação(D):',
                true,
                Constants.distancia,
                _diametroTuboDV,
                (value) => {
                      setState(() {
                        _diametroTuboDV = value!;
                      })
                    }),
            getDefaultInputField(
                _velocidadeController,
                'Velocidade do fluido(v):',
                true,
                Constants.velocidade,
                _velocidadeDV,
                (value) => {
                      setState(() {
                        _velocidadeDV = value!;
                      })
                    }),
            getDefaultInputField(
                _gravidadeController,
                'Aceleração da gravidade(g):',
                true,
                Constants.aceleracao,
                _gravidadeDV,
                (value) => {
                      setState(() {
                        _gravidadeDV = value!;
                      })
                    }),
            getDefaultInputField(
                _perdaCargaDistribuidaController,
                'Perda de carga distribuída(Hp):',
                false,
                Constants.distancia,
                _perdaCargaDistribuidaDV,
                (value) => {
                      setState(() {
                        _perdaCargaDistribuidaDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _perdaCargaDistribuidaController.text = MoodyRouse(
                            _coefAtritoController.text,
                            _comprimentoTuboController.text,
                            _diametroTuboController.text,
                            _velocidadeController.text,
                            _gravidadeController.text,
                            _comprimentoTuboDV.multiple,
                            _diametroTuboDV.multiple,
                            _velocidadeDV.multiple,
                            _gravidadeDV.multiple,
                            _perdaCargaDistribuidaDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
