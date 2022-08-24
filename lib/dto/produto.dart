import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/inteface/i_entity.dart';

class Produto extends IEntity {
  @override
  int id;
  String descricao;
  double valor;
  String ingredientes;
  bool disponivel;
  Fornecedor fornecedor;

  Produto({
    this.id = 0,
    this.descricao = '',
    this.valor = 0,
    this.ingredientes = '',
    this.disponivel = false,
    Fornecedor? fornecedor,
  }) : fornecedor = fornecedor ?? Fornecedor();
}
