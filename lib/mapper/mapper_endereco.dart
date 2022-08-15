import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_endereco.dart';

class MapperEndereco implements IMapperEndereco {
  @override
  Map<String, dynamic> toMap(Endereco endereco) {
    return {
      'id': endereco.id?.toInt(),
      'nome': endereco.nome,
      'apelido': endereco.apelido,
      'complemento': endereco.complemento,
      'descricao': endereco.descricao,
      'latitude': endereco.latitude.toDouble(),
      'longitude': endereco.longitude.toDouble(),
      'usuarioId': endereco.usuarioId?.toInt(),
    };
  }

  @override
  Endereco fromMap(Map<String, dynamic> map) {
    return Endereco(
      id: map['id']?.toInt(),
      nome: map['nome'],
      apelido: map['apelido'],
      complemento: map['complemento'],
      descricao: map['descricao'],
      latitude: map['latitude'].toDouble(),
      longitude: map['longitude'].toDouble(),
      usuarioId: map['usuarioId']?.toInt(),
    );
  }
}
