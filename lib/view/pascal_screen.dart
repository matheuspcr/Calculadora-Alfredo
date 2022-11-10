import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../model/measurement_unities.dart';
import 'components/default_layout_components.dart';

class PascalScreen extends StatefulWidget {
  const PascalScreen({super.key});

  @override
  State<PascalScreen> createState() => _PascalScreenState();
}

class _PascalScreenState extends State<PascalScreen> {
  final TextEditingController _forca1Controller = TextEditingController();
  final TextEditingController _area1Controller = TextEditingController();
  final TextEditingController _forca2Controller = TextEditingController();
  final TextEditingController _area2PressaoController = TextEditingController();

  Unit _forca1DV = Constants.forca.first;
  Unit _area1DV = Constants.area.first;
  Unit _forca2DV = Constants.forca.first;
  Unit _area2DV = Constants.area.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _forca1Controller,
                'Força 1(F1):',
                true,
                Constants.forca,
                _forca1DV,
                (value) => {
                      setState(() {
                        _forca1DV = value!;
                      })
                    }),
            getDefaultInputField(
                _area1Controller,
                'Area 1(A1):',
                true,
                Constants.area,
                _area1DV,
                (value) => {
                      setState(() {
                        _area1DV = value!;
                      })
                    }),
            getDefaultInputField(
                _forca2Controller,
                'Força 2(F2):',
                true,
                Constants.forca,
                _forca2DV,
                (value) => {
                      setState(() {
                        _forca2DV = value!;
                      })
                    }),
            getDefaultInputField(
                _area2PressaoController,
                'Area 2(A2):',
                true,
                Constants.area,
                _area2DV,
                (value) => {
                      setState(() {
                        _area2DV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          if (_forca1Controller.text.isEmpty)
                            {_forca1Controller.text = getPascalValue()}
                          else if (_area1Controller.text.isEmpty)
                            {_area1Controller.text = getPascalValue()}
                          else if (_forca2Controller.text.isEmpty)
                            {_forca2Controller.text = getPascalValue()}
                          else if (_area2PressaoController.text.isEmpty)
                            {_area2PressaoController.text = getPascalValue()}
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }

  String getPascalValue() {
    return Pascal(_forca1Controller.text, _area1Controller.text,
            _forca2Controller.text, _area2PressaoController.text)
        .calcular()
        .toString();
  }
}
