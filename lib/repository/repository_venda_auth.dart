import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_customer/repository/repository_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';

class RepositoryVendaAuth<T extends Venda, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryVendaAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'vendas';

  RepositoryVendaAuth(this.config, this.auth, this.mapper);
}
