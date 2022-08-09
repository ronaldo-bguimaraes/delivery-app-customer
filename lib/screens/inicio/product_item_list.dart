import 'package:flutter/cupertino.dart';

class ProductItemList{
  final String descricao;
  final double valor;
  final String fornecedor;
  final String ingredientes;
  final bool disponivel;
  final String categoria;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  const ProductItemList({
    required this.descricao,
    required this.valor,
    required this.fornecedor,
    required this.ingredientes,
    required this.disponivel,
    required this.categoria,
    required this.image,
    required this.event
  });
}