import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_base/model/measurement_unities.dart';
import 'package:calculadora_base/view/components/default_layout_components.dart';

class MassaEspecScreen extends StatefulWidget {
  const MassaEspecScreen({super.key});

  @override
  State<MassaEspecScreen> createState() => _MassaEspecScreenState();
}

class _MassaEspecScreenState extends State<MassaEspecScreen> {
  final TextEditingController _massaController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _massaEspecController = TextEditingController();

  Unit _massaDV = Constants.massa.first;
  Unit _volumeDV = Constants.volume.first;
  Unit _massaEspecDV = Constants.densidade.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _massaController,
                'Massa(m):',
                true,
                Constants.massa,
                _massaDV,
                (value) => {
                      setState(() {
                        _massaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _volumeController,
                'Volume(V):',
                true,
                Constants.volume,
                _volumeDV,
                (value) => {
                      setState(() {
                        _volumeDV = value!;
                      })
                    }),
            getDefaultInputField(
                _massaEspecController,
                'Massa específica(ρ):',
                false,
                Constants.densidade,
                _massaEspecDV,
                (value) => {
                      setState(() {
                        _massaEspecDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _massaEspecController.text = MassaEspecifica(
                                  _massaController.text,
                                  _volumeController.text,
                                  _massaDV.multiple,
                                  _volumeDV.multiple,
                                  _massaEspecDV.multiple)
                              .calcular()
                              .toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
