import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceProdutoAuth<T extends Produto, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceProdutoAuth<T, U> {
  IRepositoryProdutoAuth<T, U> repositoryProduto;

  ServiceProdutoAuth(this.repositoryProduto) : super(repositoryProduto);
}
