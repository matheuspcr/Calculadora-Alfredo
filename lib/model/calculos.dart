import 'dart:math';

abstract class OP {
  num calcular();
}

class MassaEspecifica implements OP {
  final String massa;
  final String volume;

  final num unidadeMassa;
  final num unidadeVolume;
  final num unidadeMassaEspec;

  @override
  num calcular() {
    return ((num.parse(massa) * unidadeMassa) / (num.parse(volume) * unidadeVolume)) * unidadeMassaEspec;
  }

  MassaEspecifica(this.massa, this.volume, this.unidadeMassa, this.unidadeVolume, this.unidadeMassaEspec);
}

class VolumeEspecifico implements OP {
  final String massa;
  final String volume;

  final num unidadeMassa;
  final num unidadeVolume;
  final num unidadeVolumeEspec;

  @override

  num calcular() {
    return ((num.parse(volume) * unidadeVolume) / (num.parse(massa) * unidadeMassa)) * unidadeVolumeEspec;
  }

  VolumeEspecifico(this.massa, this.volume, this.unidadeMassa, this.unidadeVolume, this.unidadeVolumeEspec);
}

class PesoEspecifico implements OP {
  final String massa;
  final String gravidade;
  final String volume;

  final num unidadeMassa;
  final num unidadeGravidade;
  final num unidadeVolume;
  final num unidadePesoEspec;

  @override
  num calcular() {
    return (((num.parse(massa) * unidadeMassa) * (num.parse(gravidade) * unidadeGravidade)) / (num.parse(volume) * unidadeVolume) ) * unidadePesoEspec;
  }

  PesoEspecifico(this.massa, this.volume, this.gravidade, this.unidadeMassa, this.unidadeGravidade, this.unidadeVolume, this.unidadePesoEspec);
}

class DensidadeRelativa implements OP {
  final String pesoEspecifico1;
  final String pesoEspecifico2;

  final num unidadePeso1;
  final num unidadePeso2;

  @override
  num calcular() {
    return (num.parse(pesoEspecifico1) * unidadePeso1) / (num.parse(pesoEspecifico2) * unidadePeso2);
  }

  DensidadeRelativa(this.pesoEspecifico1, this.pesoEspecifico2, this.unidadePeso1, this.unidadePeso2);
}

class Pressao implements OP {
  final String forca;
  final String area;

  final num unidadeForca;
  final num unidadeArea;
  final num unidadePressao;

  @override
  num calcular() {
    return ((num.parse(forca) * unidadeForca) / (num.parse(area) * unidadeArea)) * unidadePressao;
  }

  Pressao(this.forca, this.area, this.unidadeForca, this.unidadeArea, this.unidadePressao);
}

class Vazao implements OP {
  final String volume;
  final String tempo;

  final num unidadeVolume;
  final num unidadeTempo;
  final num unidadeVazao;

  @override
  num calcular() {
    return ((num.parse(volume) * unidadeVolume) / (num.parse(tempo) * unidadeTempo)) * unidadeVazao;
  }

  Vazao(this.volume, this.tempo, this.unidadeVolume, this.unidadeTempo, this.unidadeVazao);
}

class Reynolds implements OP {
  final String massaEspec;
  final String velocidade;
  final String diametro;
  final String coefViscosidade;


  final num unidadeMassaEspec;
  final num unidadeVelocidade;
  final num unidadeDiametroTubo;
  final num unidadeCoefViscosidade;

  @override
  num calcular() {
    return ((num.parse(massaEspec) * unidadeMassaEspec) * (num.parse(velocidade) * unidadeVelocidade) * (num.parse(diametro)) * unidadeDiametroTubo) / (num.parse(coefViscosidade) * unidadeCoefViscosidade);
  }

  Reynolds(this.massaEspec, this.velocidade, this.diametro, this.coefViscosidade, this.unidadeMassaEspec, this.unidadeVelocidade, this.unidadeDiametroTubo, this.unidadeCoefViscosidade);
}

class MoodyRouse implements OP {
  final String coefAtrito;
  final String comprimentoTubo;
  final String diametroTubo;
  final String velocidade;
  final String gravidade;

  final num unidadeComprimentoTubo;
  final num unidadeDiametroTubo;
  final num unidadeVelocidade;
  final num unidadeGravidade;
  final num unidadePerdaDeCarga;

  @override
  num calcular() {
    return (num.parse(coefAtrito) * ((num.parse(comprimentoTubo) * unidadeComprimentoTubo) / (num.parse(diametroTubo) * unidadeDiametroTubo)) * (pow((num.parse(velocidade) * unidadeVelocidade), 2) / (2 * (num.parse(gravidade) * unidadeGravidade)))) * unidadePerdaDeCarga;
  }

  MoodyRouse(this.coefAtrito, this.comprimentoTubo, this.diametroTubo, this.velocidade, this.gravidade, this.unidadeComprimentoTubo, this.unidadeDiametroTubo, this.unidadeVelocidade, this.unidadeGravidade, this.unidadePerdaDeCarga);
}

class HazenWilliams implements OP {
  final String coefExperimental;
  final String comprimentoTubo;
  final String diametroTubo;
  final String vazao;

  final num unidadeComprimentoTubo;
  final num unidadeDiametroTubo;
  final num unidadeVazao;
  final num unidadePerdaDeCarga;

  @override
  num calcular() {
    return ((num.parse(comprimentoTubo) * unidadeComprimentoTubo) * (10.641 / pow(num.parse(coefExperimental), 1.85)) * (pow((num.parse(vazao) * unidadeVazao), 1.85) / (pow((num.parse(diametroTubo) * unidadeDiametroTubo), 4.87)))) * unidadePerdaDeCarga;
  }

  HazenWilliams(this.coefExperimental, this.comprimentoTubo, this.diametroTubo, this.vazao, this.unidadeComprimentoTubo, this.unidadeDiametroTubo, this.unidadeVazao, this.unidadePerdaDeCarga);
}

class DarcyWeisbach implements OP {
  final String coefAtrito;
  final String comprimentoTubo;
  final String diametroTubo;
  final String velocidade;
  final String gravidade;

  final num unidadeComprimentoTubo;
  final num unidadeDiametroTubo;
  final num unidadeVelocidade;
  final num unidadeGravidade;
  final num unidadePerdaDeCarga;

  @override
  num calcular() {
    return (num.parse(coefAtrito) * ((num.parse(comprimentoTubo) * unidadeComprimentoTubo) / (num.parse(diametroTubo) * unidadeDiametroTubo)) * (pow((num.parse(velocidade) * unidadeVelocidade), 2) / (2 * (num.parse(gravidade) * unidadeGravidade)))) * unidadePerdaDeCarga;
  }

  DarcyWeisbach(this.coefAtrito, this.comprimentoTubo, this.diametroTubo, this.velocidade, this.gravidade, this.unidadeComprimentoTubo, this.unidadeDiametroTubo, this.unidadeVelocidade, this.unidadeGravidade, this.unidadePerdaDeCarga);
}

class Stevin implements OP {
  final String densidade;
  final String gravidade;
  final String variacaoAlturaColuna;

  final num unidadeDensidade;
  final num unidadeGravidade;
  final num unidadeAlturaColuna;
  final num unidadePressao;

  @override
  num calcular() {
    return ((num.parse(densidade) * unidadeDensidade) * (num.parse(gravidade) * unidadeGravidade) * (num.parse(variacaoAlturaColuna) * unidadeAlturaColuna)) * unidadePressao;
  }

  Stevin(this.densidade, this.gravidade, this.variacaoAlturaColuna, this.unidadeDensidade, this.unidadeGravidade, this.unidadeAlturaColuna, this.unidadePressao);
}

class Pascal implements OP {
  final String forca1;
  final String area1;
  final String forca2;
  final String area2;

  @override
  num calcular() {
    if(forca1.isEmpty) {
      return (num.parse(forca2) / num.parse(area2)) * num.parse(area1);
    } else if(area1.isEmpty) {
      return (num.parse(forca2) / num.parse(area2)) / num.parse(forca1);
    } else if(forca2.isEmpty) {
      return (num.parse(forca1) / num.parse(area1)) * num.parse(area2);
    } else {
      return (num.parse(forca1) / num.parse(area1)) / num.parse(forca2);
    }
  }

  Pascal(this.forca1, this.area1, this.forca2, this.area2);
}

class Arquimedes implements OP {
  final String densidadeFluido;
  final String volumeFluido;
  final String gravidade;

  final num unidadeDensidade;
  final num unidadeVolume;
  final num unidadeGravidade;

  @override
  num calcular() {
    return (num.parse(densidadeFluido) * unidadeDensidade) * (num.parse(volumeFluido) * unidadeVolume ) * (num.parse(gravidade) * unidadeGravidade);
  }

  Arquimedes(this.densidadeFluido, this.volumeFluido, this.gravidade, this.unidadeDensidade, this.unidadeVolume, this.unidadeGravidade);
}