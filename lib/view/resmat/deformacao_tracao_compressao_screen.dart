import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class DeformacaoTracaoCompressaoScreen extends StatefulWidget {
  const DeformacaoTracaoCompressaoScreen({super.key});

  @override
  State<DeformacaoTracaoCompressaoScreen> createState() => _DeformacaoTracaoCompressaoScreenState();
}

class _DeformacaoTracaoCompressaoScreenState extends State<DeformacaoTracaoCompressaoScreen> {
  final TextEditingController _variacaoComprimentoController =
      TextEditingController();
  final TextEditingController _comprimentoInicialController = TextEditingController();
  final TextEditingController _deformacaoController = TextEditingController();

  Unit _variacaoComprimentoDV = Constants.distancia.first;
  Unit _comprimentoInicialDV = Constants.distancia.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _variacaoComprimentoController,
                'Variação comprimento(Δl):',
                true,
                Constants.distancia,
                _variacaoComprimentoDV,
                (value) => {
                      setState(() {
                        _variacaoComprimentoDV = value!;
                      })
                    }),
            getDefaultInputField(
                _comprimentoInicialController,
                'Comprimento inicial(l):',
                true,
                Constants.distancia,
                _comprimentoInicialDV,
                (value) => {
                      setState(() {
                        _comprimentoInicialDV = value!;
                      })
                    }),
            getDefaultInputFieldWithoutDropdown(
                _deformacaoController, 'Deformação tração/compressão(ε)', false),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                _deformacaoController.text = DeformacaoTracaoCompressao(
                            _variacaoComprimentoController.text,
                            _comprimentoInicialController.text,
                            _variacaoComprimentoDV.multiple,
                            _comprimentoInicialDV.multiple
                          ).calcular().toString()
                        },
                    child: const Text('Calcular', overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
