import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/screens/builder/future_snapshot_builder.dart';
import 'package:delivery_app_customer/screens/helper/get_cliente.dart';
import 'package:delivery_app_customer/screens/helper/status.dart';
import 'package:delivery_app_customer/screens/home/inicio/cart/cart_button.dart';
import 'package:delivery_app_customer/screens/home/pedido/pedido_item_list.dart';
import 'package:delivery_app_customer/service/interface/i_service_venda_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PedidoList extends StatefulWidget {
  static const String routeName = '/pedido-list';

  const PedidoList({Key? key}) : super(key: key);

  @override
  State<PedidoList> createState() => _PedidoListState();
}

class _PedidoListState extends State<PedidoList> {
  Future<List<Venda>> getVendaList() async {
    Cliente cliente = await getCurrentCliente(context);
    List<Venda> vendas = await context.read<IServiceVendaAuth>().getByCliente(cliente);
    return await context.read<IServiceVendaAuth>().includeProdutos(vendas);
  }

  final _dateFormat = DateFormat('dd/MM/yyyy');
  final _timeFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      floatingActionButton: const CartButton(),
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: FutureSnapshotBuilder<List<Venda>>(
        future: getVendaList(),
        showChild: (vendas) {
          return vendas != null && vendas.isNotEmpty;
        },
        builder: (ctx, pedidos) {
          pedidos.sort((a, b) => b.dataVenda.compareTo(a.dataVenda));
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final pedido = pedidos[index];
              final pedidoItemList = PedidoItemList.fromVenda(pedido);
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID Pedido: ${pedido.id}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Solicitado em ${_dateFormat.format(pedidoItemList.dataVenda)} às ${_timeFormat.format(pedidoItemList.dataVenda)}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Divider(),
                            ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                ItemProduto itemProduto = pedidoItemList.itensProduto[index];
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(itemProduto.produto.descricao),
                                        Text(
                                            '${itemProduto.quantidade.toString()} x R\$ ${itemProduto.valor.toStringAsFixed(2)} = R\$ ${(itemProduto.valor * itemProduto.quantidade).toStringAsFixed(2)}'),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: pedidoItemList.itensProduto.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Text('Valor total:'),
                                Text('R\$ ${pedido.total.toStringAsFixed(2)}'),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Status do pedido: ${getStatusPedido(pedido.condicao)}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  pedidoItemList.event(context);
                },
                behavior: HitTestBehavior.opaque,
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Divider(),
              );
            },
            itemCount: pedidos.length,
          );
        },
      ),
    );
  }
}
