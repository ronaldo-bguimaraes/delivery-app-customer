import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/enums/forma_pagamento.dart';

class Pagamento extends IEntity {
  @override
  int id;
  double valor;
  DateTime dataPagamento;
  FormaPagamento formaPagamento;

  Pagamento({
    this.id = 0,
    this.valor = 0,
    DateTime? dataPagamento,
    this.formaPagamento = FormaPagamento.dinheiro,
  }) : dataPagamento = dataPagamento ?? DateTime.now();
}
