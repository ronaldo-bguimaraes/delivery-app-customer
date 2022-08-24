import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/inteface/i_entity.dart';

class Usuario extends IEntity {
  @override
  int id;
  String nome;
  String telefone;
  String email;
  String? senha;
  DateTime? dataCadastro;
  String? token;
  Cliente? cliente;

  Usuario({
    this.id = 0,
    this.nome = '',
    this.telefone = '',
    this.email = '',
    this.senha = '',
    this.dataCadastro,
    this.token,
    this.cliente,
  });
}
