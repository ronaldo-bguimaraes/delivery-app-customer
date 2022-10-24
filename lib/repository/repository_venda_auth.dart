import 'dart:io';

import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/json/json_tool.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_customer/repository/repository_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

class RepositoryVendaAuth<T extends Venda, U extends Usuario, V extends Cliente> extends RepositoryAuth<T, U> implements IRepositoryVendaAuth<T, U, V> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'vendas';

  RepositoryVendaAuth(this.config, this.auth, this.mapper);

  @override
  Future<List<T>> getByCliente(V cliente) async {
    final response = await http.get(
      Uri.parse('$fullPath/clientes/${cliente.id}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${auth.currentToken}',
      },
    );
    List list = JsonTool.decode(response.body);
    return list.map((e) => mapper.fromMap(e)).toList();
  }
}
