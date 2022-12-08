import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class HazenWilliamsScreen extends StatefulWidget {
  const HazenWilliamsScreen({super.key});

  @override
  State<HazenWilliamsScreen> createState() => _HazenWilliamsScreenState();
}

class _HazenWilliamsScreenState extends State<HazenWilliamsScreen> {
  final TextEditingController _coefRugosidadeController =
      TextEditingController();
  final TextEditingController _comprimentoTuboController =
      TextEditingController();
  final TextEditingController _diametroTuboController = TextEditingController();
  final TextEditingController _velocidadeMediaController = TextEditingController();
  final TextEditingController _perdaCargaDistribuidaController =
      TextEditingController();

  Unit _comprimentoTuboDV = Constants.distancia.first;
  Unit _diametroTuboDV = Constants.distancia.first;
  Unit _velocidadeMediaDV = Constants.velocidade.first;
  Unit _perdaCargaDistribuidaDV = Constants.distancia.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputFieldWithoutDropdown(_coefRugosidadeController,
                'Coeficiente de rugosidade do tubo(C):', true),
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
                _velocidadeMediaController,
                'Velocidade média(V):',
                true,
                Constants.velocidade,
                _velocidadeMediaDV,
                (value) => {
                      setState(() {
                        _velocidadeMediaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _perdaCargaDistribuidaController,
                'Perda de carga(Hf):',
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
                            _coefRugosidadeController.text,
                            _comprimentoTuboController.text,
                            _diametroTuboController.text,
                            _velocidadeMediaController.text,
                            _comprimentoTuboDV.multiple,
                            _diametroTuboDV.multiple,
                            _velocidadeMediaDV.multiple,
                            _perdaCargaDistribuidaDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
