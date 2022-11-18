import 'package:delivery_app_customer/enums/condicao_venda.dart';

String? getStatusPedido(CondicaoVenda condicaoVenda) {
  final map = {
    CondicaoVenda.solicitada: 'solicitado',
    CondicaoVenda.confirmada: 'confirmado',
    CondicaoVenda.finalizada: 'finalizado',
    CondicaoVenda.cancelada: 'cancelado',
  };
  if (map.containsKey(condicaoVenda)) {
    return map[condicaoVenda];
  }
  return 'indefinido';
}
