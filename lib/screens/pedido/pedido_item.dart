import 'package:flutter/material.dart';

class PedidoItem {
  final String title;
  final ImageProvider<Object> image;
  final void Function(BuildContext) event;

  const PedidoItem({
    required this.title,
    required this.image,
    required this.event,
  });
}
