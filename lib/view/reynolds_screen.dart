import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../model/measurement_unities.dart';
import 'components/default_layout_components.dart';

class ReynoldsScreen extends StatefulWidget {
  const ReynoldsScreen({super.key});

  @override
  State<ReynoldsScreen> createState() => _ReynoldsScreenState();
}

class _ReynoldsScreenState extends State<ReynoldsScreen> {
  final TextEditingController _massaEspecificaController =
      TextEditingController();
  final TextEditingController _velocidadeController = TextEditingController();
  final TextEditingController _diametroController = TextEditingController();
  final TextEditingController _coefViscosidadeController =
      TextEditingController();
  final TextEditingController _coefReynoldsController = TextEditingController();

  Unit _massaEspecificaDV = Constants.densidadeRey.first;
  Unit _velocidadeDV = Constants.velocidade.first;
  Unit _diametroDV = Constants.distancia.first;
  Unit _coefViscosidadeDV = Constants.viscosidade.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _massaEspecificaController,
                'Massa específica(ρ):',
                true,
                Constants.densidadeRey,
                _massaEspecificaDV,
                (value) => {
                      setState(() {
                        _massaEspecificaDV = value!;
                      })
                    }),
            getDefaultInputField(
                _velocidadeController,
                'Velocidade do fluido(V):',
                true,
                Constants.velocidade,
                _velocidadeDV,
                (value) => {
                      setState(() {
                        _velocidadeDV = value!;
                      })
                    }),
            getDefaultInputField(
                _diametroController,
                'Diametro da tubulação(D):',
                true,
                Constants.distancia,
                _diametroDV,
                (value) => {
                      setState(() {
                        _diametroDV = value!;
                      })
                    }),
            getDefaultInputField(
                _coefViscosidadeController,
                'Viscosidade dinâmica do fluido(μ):',
                true,
                Constants.viscosidade,
                _coefViscosidadeDV,
                (value) => {
                      setState(() {
                        _coefViscosidadeDV = value!;
                      })
                    }),
            getDefaultInputFieldWithoutDropdown(
                _coefReynoldsController, 'Coeficiente de Reynolds', false),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _coefReynoldsController.text = Reynolds(
                            _massaEspecificaController.text,
                            _velocidadeController.text,
                            _diametroController.text,
                            _coefViscosidadeController.text,
                            _massaEspecificaDV.multiple,
                            _velocidadeDV.multiple,
                            _diametroDV.multiple,
                            _coefViscosidadeDV.multiple,
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
