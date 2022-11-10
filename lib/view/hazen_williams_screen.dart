import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../model/measurement_unities.dart';
import 'components/default_layout_components.dart';

class HazenWilliamsScreen extends StatefulWidget {
  const HazenWilliamsScreen({super.key});

  @override
  State<HazenWilliamsScreen> createState() => _HazenWilliamsScreenState();
}

class _HazenWilliamsScreenState extends State<HazenWilliamsScreen> {
  final TextEditingController _coefExperimentalController =
      TextEditingController();
  final TextEditingController _comprimentoTuboController =
      TextEditingController();
  final TextEditingController _diametroTuboController = TextEditingController();
  final TextEditingController _vazaoController = TextEditingController();
  final TextEditingController _perdaCargaDistribuidaController =
      TextEditingController();

  Unit _comprimentoTuboDV = Constants.distancia.first;
  Unit _diametroTuboDV = Constants.distancia.first;
  Unit _vazaoDV = Constants.vazao.first;
  Unit _perdaCargaDistribuidaDV = Constants.distancia.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputFieldWithoutDropdown(_coefExperimentalController,
                'Coeficiente de Hazen Williams(C):', true),
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
                _vazaoController,
                'Vazão(Q):',
                true,
                Constants.vazao,
                _vazaoDV,
                (value) => {
                      setState(() {
                        _vazaoDV = value!;
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
                          _perdaCargaDistribuidaController.text = HazenWilliams(
                            _coefExperimentalController.text,
                            _comprimentoTuboController.text,
                            _diametroTuboController.text,
                            _vazaoController.text,
                            _comprimentoTuboDV.multiple,
                            _diametroTuboDV.multiple,
                            _vazaoDV.multiple,
                            _perdaCargaDistribuidaDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
