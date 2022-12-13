import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class ModuloCisalhamentoScreen extends StatefulWidget {
  const ModuloCisalhamentoScreen({super.key});

  @override
  State<ModuloCisalhamentoScreen> createState() => _ModuloCisalhamentoScreenState();
}

class _ModuloCisalhamentoScreenState extends State<ModuloCisalhamentoScreen> {
  final TextEditingController _tensaoController =
      TextEditingController();
  final TextEditingController _deformacaoController = TextEditingController();
  final TextEditingController _moduloCisController = TextEditingController();

  Unit _tensaoDV = Constants.pressao.first;
  Unit _moduloDV = Constants.pressao.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _tensaoController,
                'Tensão(τ):',
                true,
                Constants.pressao,
                _tensaoDV,
                (value) => {
                      setState(() {
                        _tensaoDV = value!;
                      })
                    }),
            getDefaultInputFieldWithoutDropdown(
                _deformacaoController,
                'Deformação(γ):',
                true),
            getDefaultInputField(
                _moduloCisController, 'Módulo Cisalhamento(G)', false,
                Constants.pressao,
                _moduloDV,
                    (value) => {
                  setState(() {
                    _moduloDV = value!;
                  })
                }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                _moduloCisController.text = ModuloCisalhamento(
                            _tensaoController.text,
                            _deformacaoController.text,
                            _tensaoDV.multiple,
                            _moduloDV.multiple
                          ).calcular().toString()
                        },
                    child: const Text('Calcular', overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
