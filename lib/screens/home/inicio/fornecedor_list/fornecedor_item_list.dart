import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:flutter/material.dart';

class FornecedorItemList {
  final String title;
  final String categoria;
  final double distancia;
  final int tempoEntrega;
  final double frete;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  const FornecedorItemList({
    required this.title,
    required this.categoria,
    required this.distancia,
    required this.tempoEntrega,
    required this.frete,
    required this.image,
    required this.event,
  });

  factory FornecedorItemList.fromForcedores(Fornecedor fornecedor) {
    return FornecedorItemList(
      title: fornecedor.razaoSocial,
      categoria: 'Categoria',
      distancia: 5.5,
      tempoEntrega: 10,
      frete: 10,
      image: const AssetImage('./assets/images/user.png'),
      event: (ctx) {
        //
      },
    );
  }
}
