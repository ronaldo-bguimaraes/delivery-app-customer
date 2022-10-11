import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_item_produto_auth.dart';
import 'package:delivery_app_customer/repository/repository_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';

class RepositoryItemProdutoAuth<T extends ItemProduto, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryItemProdutoAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'itens_produto';

  RepositoryItemProdutoAuth(this.config, this.auth, this.mapper);
}
