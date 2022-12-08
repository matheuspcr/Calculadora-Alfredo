import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class DarcyWeisbachScreen extends StatefulWidget {
  const DarcyWeisbachScreen({super.key});

  @override
  State<DarcyWeisbachScreen> createState() => _DarcyWeisbachScreenState();
}

class _DarcyWeisbachScreenState extends State<DarcyWeisbachScreen> {
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
                _coefAtritoController, 'Coeficiente de Atrito(C):', true),
            getDefaultInputField(
                _comprimentoTuboController,
                'Comprimento do encanamento(L):',
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
                'Diâmetro da canalização(D):',
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
                'Velocidade média do fluido(v):',
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
                          _perdaCargaDistribuidaController.text = DarcyWeisbach(
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
