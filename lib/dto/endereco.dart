import 'package:delivery_app_customer/dto/inteface/i_entity.dart';

class Endereco extends IEntity {
  @override
  int? id;
  String nome;
  String apelido;
  String complemento;
  String descricao;
  double latitude;
  double longitude;
  int? usuarioId;

  Endereco({
    this.id,
    this.nome = '',
    this.apelido = '',
    this.complemento = '',
    this.descricao = '',
    this.latitude = 0,
    this.longitude = 0,
    this.usuarioId = 0,
  });
}
