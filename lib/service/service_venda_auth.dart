import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_venda_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceVendaAuth<T extends Venda, U extends Usuario, V extends Cliente, W extends Produto> extends ServiceEntityAuth<T, U> implements IServiceVendaAuth<T, U, V> {
  IRepositoryVendaAuth<T, U, V> repositoryVenda;

  IServiceProdutoAuth<W, U> serviceProduto;

  ServiceVendaAuth(this.repositoryVenda, this.serviceProduto) : super(repositoryVenda);

  @override
  Future<List<T>> getByCliente(V cliente) async {
    return await repositoryVenda.getByCliente(cliente);
  }

  @override
  Future<List<T>> includeProdutos(List<T> vendas) async {
    final awaitList = vendas.map((e) async {
      final awaitList = e.itensProduto.map((e) async {
        final produto = await serviceProduto.get(e.produto.id);
        if (produto != null) {
          e.produto = produto;
        }
        return e;
      });
      e.itensProduto = await Future.wait(awaitList);
      return e;
    });
    return await Future.wait(awaitList);
  }
}
