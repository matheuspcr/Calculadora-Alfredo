import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:flutter/material.dart';
import 'components/default_layout_components.dart';

class PressaoScreen extends StatefulWidget {
  const PressaoScreen({super.key});

  @override
  State<PressaoScreen> createState() => _PressaoScreenState();
}

class _PressaoScreenState extends State<PressaoScreen> {
  final TextEditingController _forcaController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pressaoController = TextEditingController();

  Unit _forcaDV = Constants.forca.first;
  Unit _areaDV = Constants.area.first;
  Unit _pressaoDV = Constants.pressao.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _forcaController,
                'Força(F):',
                true,
                Constants.forca,
                _forcaDV,
                (value) => {
                      setState(() {
                        _forcaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _areaController,
                'Area(A):',
                true,
                Constants.area,
                _areaDV,
                (value) => {
                      setState(() {
                        _areaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _pressaoController,
                'Pressão(P):',
                false,
                Constants.pressao,
                _pressaoDV,
                (value) => {
                      setState(() {
                        _pressaoDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _pressaoController.text = Pressao(
                                  _forcaController.text,
                                  _areaController.text,
                                  _forcaDV.multiple,
                                  _areaDV.multiple,
                                  _pressaoDV.multiple)
                              .calcular()
                              .toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
