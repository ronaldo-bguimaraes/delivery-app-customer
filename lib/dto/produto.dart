import 'package:delivery_app_customer/dto/inteface/i_entity.dart';

class Produto extends IEntity {
  @override
  int id;
  String descricao;
  double valor;
  String ingredientes;
  bool disponivel;
  int fornecedorId;

  Produto({
    this.id = 0,
    this.descricao = '',
    this.valor = 0,
    this.ingredientes = '',
    this.disponivel = false,
    this.fornecedorId = 0,
  });
}
