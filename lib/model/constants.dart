import 'measurement_unities.dart';

class Constants {
  static var mainPageOptions = <Operacao>[
    Operacao(1, 'Massa Específica'),
    Operacao(2, 'Volume Específico'),
    Operacao(3, 'Peso Específico'),
    Operacao(4, 'Densidade Relativa'),
    Operacao(5, 'Vazão'),
    Operacao(6, 'Pressão'),
    Operacao(7, 'Coeficiente de Reynolds'),
    Operacao(8, 'Método de Moody-Rouse'),
    Operacao(9, 'Método de Hazen-Williams'),
    Operacao(10, 'Método de Darcy-Weisbach'),
    Operacao(11, 'Princípio de Stevin'),
    // Operacao(12, 'Princípio de Pascal'),
    Operacao(13, 'Princípio de Arquimedes')
  ];

  static var distancia = <Unit>[
    Unit("m", 1),
    Unit("dm", 0.1),
    Unit("cm", 0.01),
    Unit("mm", 0.001)
  ];

  static var area = <Unit>[
    Unit("m²", 1),
    Unit("dm²", 0.01),
    Unit("cm²", 0.0001),
    Unit("mm²", 0.000001)
  ];

  static var volume = <Unit>[
    Unit("m³", 1),
    Unit("L", 0.001),
    Unit("dm³", 0.001),
    Unit("cm³", 0.000001),
    Unit("mm³", 0.000000001)
  ];

  static var massa = <Unit>[
    Unit("kg", 1),
    Unit("g", 0.001)
  ];

  static var tempo = <Unit>[
    Unit("s", 1),
    Unit("min", 60),
    Unit("hora", 3600)
  ];

  static var densidade = <Unit>[
    Unit("kg/m³", 1),
    Unit("kg/L", 0.001)
  ];

  static var densidadeRey = <Unit>[
    Unit("kg/m³", 1),
    Unit("kg/L", 1000)
  ];

  static var volumeEspec = <Unit>[
    Unit("m³/kg", 1),
    Unit("L/kg", 1000)
  ];

  static var pesoEspec = <Unit>[
    Unit("Kg/m³", 1),
    Unit("g/m³", 0.001),
    Unit("Kg/L", 1000)
  ];

  static var pressao = <Unit>[
    Unit("N/m²", 1),
    Unit("Pa", 1),
    Unit("MPa", 0.000001),
    Unit("bar", 0.00001),
    Unit("psi", 0.000145038)
  ];

  static var vazao = <Unit>[
    Unit("m³/s", 1),
    Unit("m³/min", 60),
    Unit("m³/h", 3600),
    Unit("L/s", 1000),
    Unit("L/min", 60000),
    Unit("L/h", 3600000),
  ];

  static var aceleracao = <Unit>[
    Unit("m/s²", 1),
    Unit("km/s²", 1000)
  ];

  static var velocidade = <Unit>[
    Unit("m/s", 1),
    Unit("km/h", 0.27777)
  ];

  static var forca = <Unit>[
    Unit("N", 1),
    Unit("kgf", 9.80665)
  ];

  static var viscosidade = <Unit>[
    Unit("Kg/m*s", 1),
    Unit("Pa/s", 1),
    Unit("N*s/m²", 1),
    Unit("Poise[P]", 0.1)
  ];
}

class Operacao {
  final int id;
  final String title;

  Operacao(this.id, this.title);
}

