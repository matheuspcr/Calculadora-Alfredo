import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class ModuloElasticidadeScreen extends StatefulWidget {
  const ModuloElasticidadeScreen({super.key});

  @override
  State<ModuloElasticidadeScreen> createState() =>
      _ModuloElasticidadeScreenState();
}

class _ModuloElasticidadeScreenState extends State<ModuloElasticidadeScreen> {
  final TextEditingController _tensaoController = TextEditingController();
  final TextEditingController _deformacaoController = TextEditingController();
  final TextEditingController _moduloElasController = TextEditingController();

  Unit _tensaoDV = Constants.pressao.first;
  Unit _moduloElasDV = Constants.pressao.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _tensaoController,
                'Tensão(σ):',
                true,
                Constants.pressao,
                _tensaoDV,
                (value) => {
                      setState(() {
                        _tensaoDV = value!;
                      })
                    }),
            getDefaultInputFieldWithoutDropdown(_deformacaoController,
                'Deformação tração/compressão(ε):', true),
            getDefaultInputField(
                _moduloElasController,
                'Módulo Elasticidade(E)',
                false,
                Constants.pressao,
                _moduloElasDV,
                (value) => {
                      setState(() {
                        _moduloElasDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _moduloElasController.text = ModuloElasticidade(
                                  _tensaoController.text,
                                  _deformacaoController.text,
                                  _tensaoDV.multiple,
                                  _moduloElasDV.multiple)
                              .calcular()
                              .toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
