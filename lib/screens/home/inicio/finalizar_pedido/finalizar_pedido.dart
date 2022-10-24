import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/home/inicio/finalizar_pedido/finalizar_pedido_item_list.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:delivery_app_customer/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_venda_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalizarPedido extends StatefulWidget {
  static const String routeName = '/finalizar-pedido';

  const FinalizarPedido({Key? key}) : super(key: key);

  @override
  State<FinalizarPedido> createState() => _FinalizarPedidoState();
}

class _FinalizarPedidoState extends State<FinalizarPedido> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IServiceCart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meus pedidos'),
        ),
        body: Consumer<IServiceCart>(
          builder: (context, cart, child) {
            final FinalizarPedidoItem item = FinalizarPedidoItem(
              title: cart.defaultFornecedor?.razaoSocial ?? 'Fornecedor Mocado',
              image: const AssetImage('./assets/images/user.png'),
              event: (context) {
                //
              },
            );
            return Column(
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
                  padding: const EdgeInsets.all(10),
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
                        children: [
                          const Text("SubTotal"),
                          Text("R\$ ${cart.totalCart().toStringAsFixed(2)}"),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text("Taxa de entrega"),
                          Text("R\$ ${(cart.totalCart() * 0.1).toStringAsFixed(2)}"),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "R\$ ${cart.totalCart().toStringAsFixed(2)}",
                            style: const TextStyle(
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
                        "Selecione o endereço de entrega",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
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
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Selecione a forma de pagamento",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
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
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _saveVenda(),
                child: Text("Finalizar Pedido (R\$ ${cart.totalCart().toStringAsFixed(2)})"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _openHome() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Home.routeName,
      (route) => false,
    );
  }

  _saveVenda() async {
    try {
      final cart = context.read<IServiceCart>();
      final Usuario? usuario = context.read<IServiceAuth>().currentUser;
      if (usuario == null) {
        throw Exception('Usuário não está logado');
      }
      Cliente? cliente = await context.read<IServiceClienteAuth>().getByUsuario(usuario);
      if (cliente == null) {
        throw Exception('Cliente não encontrado');
      }
      cliente.usuario = usuario;
      final venda = Venda.fromItensProduto(cliente, cart.itensProduto);
      await context.read<IServiceVendaAuth>().save(venda);
      cart.limpaCarrinho();
      _openHome();
    }
    //
    catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text('Erro ao salvar pedido'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
