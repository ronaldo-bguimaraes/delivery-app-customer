import 'package:delivery_app_customer/screens/cart/cart_item_list.dart';
import 'package:delivery_app_customer/screens/inicio/product_item_list.dart';
import 'package:flutter/material.dart';

class BodyCart extends StatefulWidget {
  final List<CartItemList> list;

  const BodyCart({Key? key, required this.list}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
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
