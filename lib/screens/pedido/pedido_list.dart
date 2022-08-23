import 'package:delivery_app_customer/screens/pedido/pedido_item.dart';
import 'package:flutter/material.dart';

class PedidoList extends StatelessWidget {
  final List<PedidoItem> list;

  const PedidoList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var item = list[index];
          return GestureDetector(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: CircleAvatar(
                        backgroundImage: item.image,
                        radius: 20,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              item.event(context);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.black26,
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
