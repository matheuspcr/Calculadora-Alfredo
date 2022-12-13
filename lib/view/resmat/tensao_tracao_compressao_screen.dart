import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class TensaoTracaoCompressaoScreen extends StatefulWidget {
  const TensaoTracaoCompressaoScreen({super.key});

  @override
  State<TensaoTracaoCompressaoScreen> createState() =>
      _TensaoTracaoCompressaoScreenState();
}

class _TensaoTracaoCompressaoScreenState
    extends State<TensaoTracaoCompressaoScreen> {
  final TextEditingController _forcaController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _tensaoController = TextEditingController();

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
                'Força aplicada(F):',
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
                'Área(A):',
                true,
                Constants.area,
                _areaDV,
                (value) => {
                      setState(() {
                        _areaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _tensaoController,
                'Tensão tração/compressão(σ)',
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
                          _tensaoController.text = TensaoTracaoCompressao(
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
