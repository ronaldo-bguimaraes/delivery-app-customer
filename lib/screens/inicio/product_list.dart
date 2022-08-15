import 'package:delivery_app_customer/screens/inicio/product_item_list.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final List<ProductItemList> list;

  const ProductList({Key? key, required this.list}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var item = widget.list[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(item.descricao),
                        subtitle: Text(item.fornecedor),
                      ),
                      Text(item.ingredientes),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Preço: R\$" + item.valor.toString())
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(image: item.image),
                )
              ],
            ),
          );
        },
        // padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: widget.list.length,
      ),
    );
  }
}
