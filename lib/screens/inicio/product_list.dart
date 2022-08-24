import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/screens/builder/future_snapshot_builder.dart';
import 'package:delivery_app_customer/screens/inicio/product_item_list.dart';
import 'package:delivery_app_customer/service/interface/i_service_produto_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  final List<ProductItemList> list;

  const ProductList({Key? key, required this.list}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext ctx) {
    return FutureSnapshotBuilder<List<Produto>>(
      future: ctx.read<IServiceProdutoAuth>().all(),
      showChild: (produtos) {
        return produtos != null && produtos.isNotEmpty;
      },
      builder: (ctx, produtos) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              var produto = ProductItemList.fromProduto(produtos[index]);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produto.descricao,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(produto.fornecedor),
                          Text(produto.ingredientes),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Preço: R\$" + produto.valor.toString())
                        ],
                      ),
                    ),
                    Image(
                      image: produto.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Divider(),
              );
            },
            itemCount: produtos.length,
          ),
        );
      },
    );
  }
}
