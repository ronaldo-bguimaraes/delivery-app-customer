import 'package:delivery_app_customer/screens/pedido/pedido_item.dart';
import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final PedidoItem item = PedidoItem(
    title: 'CJ Lanches',
    image: const AssetImage('./assets/images/user.png'),
    event: (context) {},
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus pedidos'),
        ),
        body: Column(
          children: [
            GestureDetector(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Resumo de valores",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      Text("SubTotal"),
                      Text("R\$38,40"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      Text("Taxa de entrega"),
                      Text("R\$0,00"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "R\$38,40",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Dados de endereço",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 0,
                                child: Icon(Icons.location_pin),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: const [
                                    Text(
                                      "Rua Cel L Figueredo",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Jardim tropical",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                              const Expanded(
                                flex: 0,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        item.event(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Dados de pagamento",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 0,
                                child: Icon(Icons.payment),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: const [
                                    Text(
                                      "Crédito pelo App",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Master Card **** 3140",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                              const Expanded(
                                flex: 0,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        item.event(context);
                      },
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (() {}),
                child: const Text("Fazer pedido"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
      length: 0,
    );
  }
}
