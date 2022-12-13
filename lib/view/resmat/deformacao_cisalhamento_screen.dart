import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class DeformacaoCisalhamentoScreen extends StatefulWidget {
  const DeformacaoCisalhamentoScreen({super.key});

  @override
  State<DeformacaoCisalhamentoScreen> createState() => _DeformacaoCisalhamentoScreenState();
}

class _DeformacaoCisalhamentoScreenState extends State<DeformacaoCisalhamentoScreen> {
  final TextEditingController _tetaController =
      TextEditingController();
  final TextEditingController _deformacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputFieldWithoutDropdown(
                _tetaController,
                'Teta(θ):',
                true
            ),
            getDefaultInputFieldWithoutDropdown(
                _deformacaoController, 'Deformação cisalhamento(γ)', false),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                _deformacaoController.text = DeformacaoCisalhamento(_tetaController.text).calcular().toString()
                        },
                    child: const Text('Calcular', overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
