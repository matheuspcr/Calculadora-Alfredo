import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../model/measurement_unities.dart';
import 'components/default_layout_components.dart';

class ArquimedesScreen extends StatefulWidget {
  const ArquimedesScreen({super.key});

  @override
  State<ArquimedesScreen> createState() => _ArquimedesScreenState();
}

class _ArquimedesScreenState extends State<ArquimedesScreen> {
  final TextEditingController _densidadeController = TextEditingController();
  final TextEditingController _gravidadeController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _moduloEmpuxoController = TextEditingController();

  Unit _densidadeDV = Constants.densidade.first;
  Unit _gravidadeDV = Constants.aceleracao.first;
  Unit _volumeDV = Constants.volume.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _densidadeController,
                'Densidade(d):',
                true,
                Constants.densidade,
                _densidadeDV,
                (value) => {
                      setState(() {
                        _densidadeDV = value!;
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
                _volumeController,
                'Volume(V):',
                true,
                Constants.volume,
                _volumeDV,
                (value) => {
                      setState(() {
                        _volumeDV = value!;
                      })
                    }),
            getDefaultInputFieldWithoutDropdown(
                _moduloEmpuxoController, 'Módulo do empuxo(E):', false),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _moduloEmpuxoController.text = Arquimedes(
                            _densidadeController.text,
                            _volumeController.text,
                            _gravidadeController.text,
                            _densidadeDV.multiple,
                            _volumeDV.multiple,
                            _gravidadeDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
