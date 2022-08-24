import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_customer/repository/repository_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';

class RepositoryProdutoAuth<T extends Produto, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryProdutoAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'produtos';

  RepositoryProdutoAuth(this.config, this.auth, this.mapper);
}
