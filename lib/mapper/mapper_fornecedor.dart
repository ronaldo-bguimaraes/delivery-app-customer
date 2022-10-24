import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/usuario.dart';

import 'interface/i_mapper_fornecedor.dart';

class MapperFornecedor implements IMapperFornecedor {
  @override
  Map<String, dynamic> toMap(Fornecedor produto) {
    return {
      'id': produto.id.toInt(),
      'cnpj': produto.cnpj,
      'razaoSocial': produto.razaoSocial,
      'usuarioId': produto.usuario.id.toInt(),
    };
  }

  @override
  Fornecedor fromMap(Map<String, dynamic> map) {
    return Fornecedor(
      id: map['id'].toInt(),
      cnpj: map['cnpj'],
      razaoSocial: map['razaoSocial'],
      usuario: Usuario(
        id: map['usuarioId'].toInt(),
      ),
    );
  }
}
