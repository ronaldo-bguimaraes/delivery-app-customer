import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/entregador.dart';
import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/dto/pagamento.dart';
import 'package:delivery_app_customer/enums/condicao_venda.dart';

class Venda extends IEntity {
  @override
  int id;
  double subTotal;
  double frete;
  double total;
  DateTime dataVenda;
  double desconto;
  double valor;
  CondicaoVenda condicao;
  List<ItemProduto> itensProduto;
  Cliente cliente;
  Entregador? entregador;
  Pagamento? pagamento;
  Endereco? endereco;

  Venda({
    this.id = 0,
    this.subTotal = 0,
    this.frete = 0,
    this.total = 0,
    DateTime? dataVenda,
    this.desconto = 0,
    this.valor = 0,
    this.condicao = CondicaoVenda.solicitada,
    List<ItemProduto>? itensProduto,
    Cliente? cliente,
    this.entregador,
    this.pagamento,
    this.endereco,
  })  : dataVenda = dataVenda ?? DateTime.now(),
        itensProduto = itensProduto ?? [],
        cliente = cliente ?? Cliente();

  factory Venda.fromItensProduto(Cliente cliente, List<ItemProduto> itensProduto) {
    return Venda(
      cliente: cliente,
      itensProduto: itensProduto,
    );
  }
}
