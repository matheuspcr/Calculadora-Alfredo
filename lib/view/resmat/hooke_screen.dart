import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class HookeScreen extends StatefulWidget {
  const HookeScreen({super.key});

  @override
  State<HookeScreen> createState() => _HookeScreenState();
}

class _HookeScreenState extends State<HookeScreen> {
  final TextEditingController _constanteElasticaController =
      TextEditingController();
  final TextEditingController _deformacaoMolaController = TextEditingController();
  final TextEditingController _forcaElasticaController = TextEditingController();

  Unit _constanteElasticaDV = Constants.pressao.first;
  Unit _deformacaoMolaDV = Constants.distancia.first;
  Unit _forcaElasticaDV = Constants.forca.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _constanteElasticaController,
                'Constante elástica(k):',
                true,
                Constants.pressao,
                _constanteElasticaDV,
                (value) => {
                      setState(() {
                        _constanteElasticaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _deformacaoMolaController,
                'Deformação da mola(x):',
                true,
                Constants.distancia,
                _deformacaoMolaDV,
                (value) => {
                      setState(() {
                        _deformacaoMolaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _forcaElasticaController, 'Força elástica(F)', false,
                Constants.forca,
                _forcaElasticaDV,
                    (value) => {
                  setState(() {
                    _forcaElasticaDV = value!;
                  })
                }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                _forcaElasticaController.text = Hooke(
                            _constanteElasticaController.text,
                            _deformacaoMolaController.text,
                            _constanteElasticaDV.multiple,
                            _deformacaoMolaDV.multiple,
                            _forcaElasticaDV.multiple
                          ).calcular().toString()
                        },
                    child: const Text('Calcular', overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
