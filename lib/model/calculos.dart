import 'dart:math';

abstract class OP {
  num calcular();
}

/**
 *
 * Mecflu
 *
 */

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
    return ((num.parse(massaEspec) / unidadeMassaEspec) * (num.parse(velocidade) * unidadeVelocidade) * (num.parse(diametro)) * unidadeDiametroTubo) / (num.parse(coefViscosidade) * unidadeCoefViscosidade);
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
  final String coefRugosidade;
  final String comprimentoTubo;
  final String diametroTubo;
  final String velocidade;

  final num unidadeComprimentoTubo;
  final num unidadeDiametroTubo;
  final num unidadeVelocidade;
  final num unidadePerdaDeCarga;

  @override
  num calcular() {
    return (((num.parse(comprimentoTubo) * unidadeComprimentoTubo * 6.78) * (pow((num.parse(velocidade) * unidadeVelocidade), 1.85))) / ((pow((num.parse(diametroTubo) * unidadeDiametroTubo), 1.165)) * (pow(num.parse(coefRugosidade), 1.85)))) / unidadePerdaDeCarga;
  }

  HazenWilliams(this.coefRugosidade, this.comprimentoTubo, this.diametroTubo, this.velocidade, this.unidadeComprimentoTubo, this.unidadeDiametroTubo, this.unidadeVelocidade, this.unidadePerdaDeCarga);
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
    return ((4 * num.parse(coefAtrito) * (num.parse(comprimentoTubo) * unidadeComprimentoTubo) * (pow((num.parse(velocidade) * unidadeVelocidade), 2))) / ((num.parse(diametroTubo) * unidadeDiametroTubo) * (2 * (num.parse(gravidade) * unidadeGravidade)))) / unidadePerdaDeCarga;
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
  final String velocidadeFluido;
  final String gravidade;

  final num unidadeDensidade;
  final num unidadeVelocidade;
  final num unidadeGravidade;
  final num unidadeForca;

  @override
  num calcular() {
    return ((num.parse(densidadeFluido) * unidadeDensidade) * (num.parse(velocidadeFluido) * unidadeVelocidade ) * (num.parse(gravidade) * unidadeGravidade)) / unidadeForca;
  }

  Arquimedes(this.densidadeFluido, this.velocidadeFluido, this.gravidade, this.unidadeDensidade, this.unidadeVelocidade, this.unidadeGravidade, this.unidadeForca);
}


class PotenciaAcionamentoBomba implements OP {
  final String pesoEspec;
  final String areaPistao;
  final String comprimentoCurso;
  final String velocidade; //RPM
  final String alturaCentroCilindro;
  final String alturaElevacaoLiquido;

  final num unidadePesoEspec;
  final num unidadeAreaPistao;
  final num unidadeComprimento;
  final num unidadeVelocidade;
  final num unidadeAlturaCentroCilindro;
  final num unidadeAlturaElevacaoLiquido;
  final num unidadePotencia;

  @override
  num calcular() {
    return (((num.parse(pesoEspec) * unidadePesoEspec) * (num.parse(areaPistao) * unidadeAreaPistao) * (num.parse(comprimentoCurso) * unidadeComprimento) * (num.parse(velocidade) * unidadeVelocidade) * ((num.parse(alturaCentroCilindro) * unidadeAlturaCentroCilindro) + (num.parse(alturaElevacaoLiquido) * unidadeAlturaElevacaoLiquido))) / 60) * unidadePotencia;

  }

  PotenciaAcionamentoBomba(this.pesoEspec, this.areaPistao, this.comprimentoCurso, this.velocidade, this.alturaCentroCilindro, this.alturaElevacaoLiquido, this.unidadePesoEspec, this.unidadeAreaPistao, this.unidadeComprimento, this.unidadeVelocidade, this.unidadeAlturaCentroCilindro, this.unidadeAlturaElevacaoLiquido, this.unidadePotencia);
}

/**
 *
 * Resmat
 *
 */


class TensaoTracaoCompressao implements OP {
  final String forca;
  final String area;

  final num unidadeForca;
  final num unidadeArea;
  final num unidadePressao;

  @override
  num calcular() {
    return ((num.parse(forca) * unidadeForca) / (num.parse(area) * unidadeArea)) * unidadePressao;
    
  }

  TensaoTracaoCompressao(this.forca, this.area, this.unidadeForca, this.unidadeArea, this.unidadePressao);
}


class TensaoCisalhamento implements OP {
  final String forca;
  final String area;

  final num unidadeForca;
  final num unidadeArea;
  final num unidadePressao;

  @override
  num calcular() {
    return ((num.parse(forca) * unidadeForca) / (num.parse(area) * unidadeArea)) * unidadePressao;
  }

  TensaoCisalhamento(this.forca, this.area, this.unidadeForca, this.unidadeArea, this.unidadePressao);
}


class DeformacaoTracaoCompressao implements OP {
  final String variacaoLargura;
  final String larguraInicial;

  final num unidadeVariacaoLargura;
  final num unidadeLarguraInicial;

  @override
  num calcular() {
    return (num.parse(variacaoLargura) * unidadeVariacaoLargura) / (num.parse(larguraInicial) * unidadeLarguraInicial);
  }

  DeformacaoTracaoCompressao(this.variacaoLargura, this.larguraInicial, this.unidadeVariacaoLargura, this.unidadeLarguraInicial);

}


class DeformacaoCisalhamento implements OP {
  final String teta;

  DeformacaoCisalhamento(this.teta);

  @override
  num calcular() {
    return tan(num.parse(teta));
  }
}


class ModuloElasticidade implements OP {
  final String tensao;
  final String deformacao;

  final num unidadeTensao;
  final num unidadeModuloElas;

  @override
  num calcular() {
    return ((num.parse(tensao) * unidadeTensao) / (num.parse(deformacao)) * unidadeModuloElas);
  }

  ModuloElasticidade(this.tensao, this.deformacao, this.unidadeTensao, this.unidadeModuloElas);
}


class ModuloCisalhamento implements OP {
  final String tensao;
  final String deformacao;

  final num unidadeTensao;
  final num unidadeModulo;

  @override
  num calcular() {
    return (num.parse(tensao) * unidadeTensao) / (num.parse(deformacao)) * unidadeModulo;
  }

  ModuloCisalhamento(this.tensao, this.deformacao, this.unidadeTensao, this.unidadeModulo);
}


class Hooke implements OP {
  final String constanteElastica;
  final String deformacaoMola;

  final num unidadeConstanteElastica;
  final num unidadeDeformacao;
  final num unidadeForcaElastica;

  Hooke(this.constanteElastica, this.deformacaoMola, this.unidadeConstanteElastica, this.unidadeDeformacao, this.unidadeForcaElastica);


  @override
  num calcular() {
    return ((num.parse(constanteElastica) * unidadeConstanteElastica) * (num.parse(deformacaoMola) * unidadeDeformacao)) / unidadeForcaElastica;
  }

}
