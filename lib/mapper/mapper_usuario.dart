import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_usuario.dart';

class MapperUsuario implements IMapperUsuario {
  @override
  Map<String, dynamic> toMap(Usuario usuario) {
    return {
      'id': usuario.id.toInt(),
      'nome': usuario.nome,
      'telefone': usuario.telefone,
      'email': usuario.email,
      'senha': usuario.senha,
      'dataCadastro': usuario.dataCadastro.toUtc().toIso8601String(),
      'token': usuario.token,
    };
  }

  @override
  Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'].toInt(),
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      dataCadastro: DateTime.parse(map['dataCadastro']).toLocal(),
      token: map['token'],
    );
  }
}
