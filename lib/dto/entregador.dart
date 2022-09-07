import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/enums/sexo.dart';

class Entregador extends IEntity {
  @override
  int id;
  String cpf;
  Sexo sexo;
  DateTime dataNascimento;
  Usuario usuario;

  Entregador({
    this.id = 0,
    this.cpf = '',
    this.sexo = Sexo.masculino,
    DateTime? dataNascimento,
    Usuario? usuario,
  })  : dataNascimento = DateTime.now(),
        usuario = usuario ?? Usuario();
}
