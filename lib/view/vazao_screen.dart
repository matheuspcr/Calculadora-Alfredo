import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../model/measurement_unities.dart';
import 'components/default_layout_components.dart';

class VazaoScreen extends StatefulWidget {
  const VazaoScreen({super.key});

  @override
  State<VazaoScreen> createState() => _VazaoScreenState();
}

class _VazaoScreenState extends State<VazaoScreen> {
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _tempoController = TextEditingController();
  final TextEditingController _vazaoController = TextEditingController();

  Unit _volumeDV = Constants.volume.first;
  Unit _tempoDV = Constants.tempo.first;
  Unit _vazaoDV = Constants.vazao.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _volumeController,
                'Volume(v):',
                true,
                Constants.volume,
                _volumeDV,
                (value) => {
                      setState(() {
                        _volumeDV = value!;
                      })
                    }),
            getDefaultInputField(
                _tempoController,
                'Tempo(t):',
                true,
                Constants.tempo,
                _tempoDV,
                (value) => {
                      setState(() {
                        _tempoDV = value!;
                      })
                    }),
            getDefaultInputField(
                _vazaoController,
                'Vazão(Q):',
                false,
                Constants.vazao,
                _vazaoDV,
                (value) => {
                      setState(() {
                        _vazaoDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _vazaoController.text = Vazao(
                                  _volumeController.text,
                                  _tempoController.text,
                                  _volumeDV.multiple,
                                  _tempoDV.multiple,
                                  _vazaoDV.multiple)
                              .calcular()
                              .toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
