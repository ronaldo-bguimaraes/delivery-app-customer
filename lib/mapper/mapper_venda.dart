import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/entregador.dart';
import 'package:delivery_app_customer/dto/pagamento.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_item_produto.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_venda.dart';

class MapperVenda implements IMapperVenda {
  IMapperItemProduto mapperItemProduto;

  MapperVenda(this.mapperItemProduto);

  @override
  Map<String, dynamic> toMap(Venda venda) {
    return {
      'id': venda.id.toInt(),
      'subTotal': venda.subTotal.toDouble(),
      'frete': venda.frete.toDouble(),
      'total': venda.total.toDouble(),
      'dataVenda': venda.dataVenda.toIso8601String(),
      'desconto': venda.desconto.toDouble(),
      'valor': venda.valor.toDouble(),
      'condicao': venda.condicao.value,
      'itensProduto': venda.itensProduto.map(mapperItemProduto.toMap).toList(),
      'clienteId': venda.cliente.id.toInt(),
      'entregadorId': venda.entregador.id.toInt(),
      'pagamentoId': venda.pagamento.id.toInt(),
      'enderecoId': venda.pagamento.id.toInt()
    };
  }

  @override
  Venda fromMap(Map<String, dynamic> map) {
    return Venda(
      id: map['id'].toInt(),
      subTotal: map['subTotal'].toDouble(),
      frete: map['frete'].toDouble(),
      total: map['total'].toDouble(),
      dataVenda: map['dataVenda'].toIso8601String(),
      desconto: map['desconto'].toDouble(),
      valor: map['valor'].toDouble(),
      condicao: map['condicao'].value,
      itensProduto: map['itensProduto'].map(mapperItemProduto.fromMap).toList(),
      cliente: Cliente(
        id: map['clienteId'].toInt(),
      ),
      entregador: Entregador(
        id: map['entregadorId'].toInt(),
      ),
      pagamento: Pagamento(
        id: map['pagamentoId'].toInt(),
      ),
      endereco: Endereco(
        id: map['pagamentoId'].toInt(),
      ),
    );
  }
}
