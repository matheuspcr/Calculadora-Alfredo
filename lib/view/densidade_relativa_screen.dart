import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../model/measurement_unities.dart';
import 'components/default_layout_components.dart';

class DensidadeRelativaScreen extends StatefulWidget {
  const DensidadeRelativaScreen({super.key});

  @override
  State<DensidadeRelativaScreen> createState() =>
      _DensidadeRelativaScreenState();
}

class _DensidadeRelativaScreenState extends State<DensidadeRelativaScreen> {
  final TextEditingController _pesoEspec1Controller = TextEditingController();
  final TextEditingController _pesoEspec2Controller = TextEditingController();
  final TextEditingController _densidadeRelativaController =
      TextEditingController();

  Unit _pesoEspec1DV = Constants.pesoEspec.first;
  Unit _pesoEspec2DV = Constants.pesoEspec.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _pesoEspec1Controller,
                'Peso específico 1(ρ1):',
                true,
                Constants.pesoEspec,
                _pesoEspec1DV,
                (value) => {
                      setState(() {
                        _pesoEspec1DV = value!;
                      })
                    }),
            getDefaultInputField(
                _pesoEspec2Controller,
                'Peso específico 2(ρ2):',
                true,
                Constants.pesoEspec,
                _pesoEspec2DV,
                (value) => {
                      setState(() {
                        _pesoEspec2DV = value!;
                      })
                    }),
            getDefaultInputFieldWithoutDropdown(
                _densidadeRelativaController, 'Densidade relativa(S):', false),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _densidadeRelativaController.text = DensidadeRelativa(
                                  _pesoEspec1Controller.text,
                                  _pesoEspec2Controller.text,
                                  _pesoEspec1DV.multiple,
                                  _pesoEspec2DV.multiple)
                              .calcular()
                              .toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
