import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/usuario.dart';

class Cliente extends IEntity {
  @override
  int? id;
  String cpf;
  DateTime? dataNascimento;
  Usuario usuario;

  Cliente({
    this.id,
    this.cpf = '',
    this.dataNascimento,
    Usuario? usuario,
  }) : usuario = usuario ?? Usuario();
}
