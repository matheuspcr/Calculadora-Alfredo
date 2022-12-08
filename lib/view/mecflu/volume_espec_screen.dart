import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class VolumeEspecScreen extends StatefulWidget {
  const VolumeEspecScreen({super.key});

  @override
  State<VolumeEspecScreen> createState() => _VolumeEspecScreenState();
}

class _VolumeEspecScreenState extends State<VolumeEspecScreen> {
  final TextEditingController _massaController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _volumeEspecController = TextEditingController();

  Unit _massaDV = Constants.massa.first;
  Unit _volumeDV = Constants.volume.first;
  Unit _volumeEspecDV = Constants.volumeEspec.first;

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
                _volumeEspecController,
                'Volume específico(Ve):',
                false,
                Constants.volumeEspec,
                _volumeEspecDV,
                (value) => {
                      setState(() {
                        _volumeEspecDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _volumeEspecController.text = VolumeEspecifico(
                                  _massaController.text,
                                  _volumeController.text,
                                  _massaDV.multiple,
                                  _volumeDV.multiple,
                                  _volumeEspecDV.multiple)
                              .calcular()
                              .toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
