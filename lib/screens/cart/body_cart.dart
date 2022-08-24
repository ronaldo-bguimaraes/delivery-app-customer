import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IServiceCart>(builder: (context, cart, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var item = cart.cartListItem()[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.descricao,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.fornecedor,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              cart.remove(item);
                            },
                          );
                        },
                        child: const Text("Remover"),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () {
                          if (item.quantidade > 1) {
                            setState(
                              () {
                                item.quantidade -= 1;
                              },
                            );
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        item.quantidade.toString(),
                      ),
                      IconButton(
                        color: Colors.green[800],
                        onPressed: () {
                          setState(() {
                            item.quantidade += 1;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          // padding: const EdgeInsets.all(16.0),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: cart.cartListItem().length,
        ),
      );
    });
  }
}
