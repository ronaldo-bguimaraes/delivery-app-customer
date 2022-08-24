import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/usuario.dart';

class Fornecedor extends IEntity {
  @override
  int id;
  String cnpj;
  String razaoSocial;
  Usuario usuario;

  Fornecedor({
    this.id = 0,
    this.cnpj = '',
    this.razaoSocial = '',
    Usuario? usuario,
  }) : usuario = usuario ?? Usuario();
}
