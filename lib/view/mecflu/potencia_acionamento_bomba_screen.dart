import 'package:calculadora_base/model/calculos.dart';
import 'package:calculadora_base/model/constants.dart';
import 'package:flutter/material.dart';
import '../../model/measurement_unities.dart';
import '../components/default_layout_components.dart';

class PotenciaAcionamentoBombaScreen extends StatefulWidget {
  const PotenciaAcionamentoBombaScreen({super.key});

  @override
  State<PotenciaAcionamentoBombaScreen> createState() => _PotenciaAcionamentoBombaScreenState();
}

class _PotenciaAcionamentoBombaScreenState extends State<PotenciaAcionamentoBombaScreen> {
  final TextEditingController _pesoEspecController = TextEditingController();
  final TextEditingController _areaPistaoController = TextEditingController();
  final TextEditingController _comprimentoCursoController = TextEditingController();
  final TextEditingController _velocidadeController = TextEditingController();
  final TextEditingController _alturaCilindroController = TextEditingController();
  final TextEditingController _alturaElevacaoLiquidoController = TextEditingController();
  final TextEditingController _potenciaNecessariaBombaController = TextEditingController();

  Unit _pesoEspecDV = Constants.pesoEspec.first;
  Unit _areaPistaoDV = Constants.area.first;
  Unit _comprimentoCursoDV = Constants.distancia.first;
  Unit _velocidadeDV = Constants.frequencia.first;
  Unit _alturaCentroCilindroDV = Constants.distancia.first;
  Unit _alturaElevacaoLiquidoDV = Constants.distancia.first;
  Unit _potenciaBombaDV = Constants.potencia.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            getDefaultInputField(
                _pesoEspecController,
                'Peso específico(γ):',
                true,
                Constants.pesoEspec,
                _pesoEspecDV,
                    (value) => {
                  setState(() {
                    _pesoEspecDV = value!;
                  })
                }),
            getDefaultInputField(
                _areaPistaoController,
                'Área do pistão(Ap):',
                true,
                Constants.area,
                _areaPistaoDV,
                (value) => {
                      setState(() {
                        _areaPistaoDV = value!;
                      })
                    }),
            getDefaultInputField(
                _comprimentoCursoController,
                'Comprimento do curso(L):',
                true,
                Constants.distancia,
                _comprimentoCursoDV,
                (value) => {
                      setState(() {
                        _comprimentoCursoDV = value!;
                      })
                    }),
            getDefaultInputField(
                _velocidadeController,
                'Velocidade de rotação do motor(N):',
                true,
                Constants.frequencia,
                _velocidadeDV,
                (value) => {
                      setState(() {
                        _velocidadeDV = value!;
                      })
                    }),
            getDefaultInputField(
                _alturaCilindroController,
                'Altura do centro do cilindro(hs):',
                true,
                Constants.distancia,
                _alturaCentroCilindroDV,
                (value) => {
                      setState(() {
                        _alturaCentroCilindroDV = value!;
                      })
                    }),
            getDefaultInputField(
                _alturaElevacaoLiquidoController,
                'Altura à qual o líquido é elevado(hd):',
                true,
                Constants.distancia,
                _alturaElevacaoLiquidoDV,
                (value) => {
                      setState(() {
                        _alturaElevacaoLiquidoDV = value!;
                      })
                    }),
            getDefaultInputField(
                _potenciaNecessariaBombaController,
                'Potência necessária acionar bomba(P):',
                false,
                Constants.potencia,
                _potenciaBombaDV,
                    (value) => {
                  setState(() {
                    _potenciaBombaDV = value!;
                  })
                }),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => {
                          _potenciaNecessariaBombaController.text = PotenciaAcionamentoBomba(
                            _pesoEspecController.text,
                            _areaPistaoController.text,
                            _comprimentoCursoController.text,
                            _velocidadeController.text,
                            _alturaCilindroController.text,
                            _alturaElevacaoLiquidoController.text,
                            _pesoEspecDV.multiple,
                            _areaPistaoDV.multiple,
                            _comprimentoCursoDV.multiple,
                            _velocidadeDV.multiple,
                            _alturaCentroCilindroDV.multiple,
                            _alturaElevacaoLiquidoDV.multiple,
                            _potenciaBombaDV.multiple
                          ).calcular().toString()
                        },
                    child: const Text('Calcular',
                        overflow: TextOverflow.ellipsis)))
          ],
        ));
  }
}
