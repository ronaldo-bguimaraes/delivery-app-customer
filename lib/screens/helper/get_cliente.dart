import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_cliente_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<Cliente> getCurrentCliente(BuildContext context) async {
  final Usuario? usuario = context.read<IServiceAuth>().currentUser;
  if (usuario == null) {
    throw Exception('Usuário não está logado');
  }
  Cliente? cliente = await context.read<IServiceClienteAuth>().getByUsuario(usuario);
  if (cliente == null) {
    throw Exception('Cliente não encontrado');
  }
  cliente.usuario = usuario;
  return cliente;
}
