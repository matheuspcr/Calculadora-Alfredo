import 'package:calculadora_base/model/calculos.dart';
import 'package:flutter/material.dart';
import '../../model/constants.dart';
import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class PesoEspecScreen extends StatefulWidget {
  const PesoEspecScreen({super.key});

  @override
  State<PesoEspecScreen> createState() => _PesoEspecScreenState();
}

class _PesoEspecScreenState extends State<PesoEspecScreen> {
  final TextEditingController _massaController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _gravidadeController = TextEditingController();
  final TextEditingController _pesoEspecController = TextEditingController();

  Unit _massaDV = Constants.massa.first;
  Unit _volumeDV = Constants.volume.first;
  Unit _gravidadeDV = Constants.aceleracao.first;
  Unit _pesoEspecDV = Constants.pesoEspec.first;

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
                _gravidadeController,
                'Gravidade(g):',
                true,
                Constants.aceleracao,
                _gravidadeDV,
                (value) => {
                      setState(() {
                        _gravidadeDV = value!;
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
                _pesoEspecController,
                'Peso específico(γ):',
                false,
                Constants.pesoEspec,
                _pesoEspecDV,
                (value) => {
                      setState(() {
                        _pesoEspecDV = value!;
                      })
                    }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _pesoEspecController.text = PesoEspecifico(
                            _massaController.text,
                            _volumeController.text,
                            _gravidadeController.text,
                            _massaDV.multiple,
                            _gravidadeDV.multiple,
                            _volumeDV.multiple,
                            _pesoEspecDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
