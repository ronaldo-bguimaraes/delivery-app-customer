import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_fornecedor_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceProdutoAuth<T extends Produto, U extends Fornecedor, V extends Usuario> extends ServiceEntityAuth<T, V> implements IServiceProdutoAuth<T, V> {
  IRepositoryProdutoAuth<T, V> repositoryProduto;
  IServiceFornecedorAuth<U, V> serviceFornecedor;

  ServiceProdutoAuth(this.repositoryProduto, this.serviceFornecedor) : super(repositoryProduto);

  @override
  Future<List<T>> allWithFornecedores() async {
    final list = await all();
    final awaitList = list.map((e) async {
      final fornecedor = await serviceFornecedor.get(e.fornecedor.id);
      if (fornecedor != null) {
        e.fornecedor = fornecedor;
      }
      return e;
    });
    return await Future.wait(awaitList);
  }
}
