import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/usuario.dart';

class Endereco extends IEntity {
  @override
  int id;
  String nome;
  String apelido;
  String complemento;
  String descricao;
  double latitude;
  double longitude;
  Usuario usuario;

  Endereco({
    this.id = 0,
    this.nome = '',
    this.apelido = '',
    this.complemento = '',
    this.descricao = '',
    this.latitude = 0,
    this.longitude = 0,
    Usuario? usuario,
  }) : usuario = usuario ?? Usuario();
}
