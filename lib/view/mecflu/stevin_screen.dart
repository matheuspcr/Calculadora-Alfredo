import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class StevinScreen extends StatefulWidget {
  const StevinScreen({super.key});

  @override
  State<StevinScreen> createState() => _StevinScreenState();
}

class _StevinScreenState extends State<StevinScreen> {
  final TextEditingController _densidadeController = TextEditingController();
  final TextEditingController _gravidadeController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _variacaoPressaoController =
      TextEditingController();

  Unit _densidadeDV = Constants.densidade.first;
  Unit _gravidadeDV = Constants.aceleracao.first;
  Unit _alturaDV = Constants.distancia.first;
  Unit _variacaoPressaoDV = Constants.pressao.first;

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
                _alturaController,
                'Variação da altura da coluna de líquido(∆h):',
                true,
                Constants.distancia,
                _alturaDV,
                (value) => {
                      setState(() {
                        _alturaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _variacaoPressaoController,
                'Variação da pressão(∆P):',
                false,
                Constants.pressao,
                _variacaoPressaoDV,
                (value) => {
                      setState(() {
                        _variacaoPressaoDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _variacaoPressaoController.text = Stevin(
                            _densidadeController.text,
                            _gravidadeController.text,
                            _alturaController.text,
                            _densidadeDV.multiple,
                            _gravidadeDV.multiple,
                            _alturaDV.multiple,
                            _variacaoPressaoDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
