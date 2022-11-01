import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/screens/builder/future_snapshot_builder.dart';
import 'package:delivery_app_customer/screens/home/inicio/fornecedor_list/fornecedor_item_list.dart';
import 'package:delivery_app_customer/service/interface/i_service_fornecedor_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FornecedorList extends StatelessWidget {
  const FornecedorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureSnapshotBuilder<List<Fornecedor>>(
      future: context.read<IServiceFornecedorAuth>().all(),
      showChild: (fornecedor) {
        return fornecedor != null && fornecedor.isNotEmpty;
      },
      builder: (ctx, fornecedores) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final fornecedor = fornecedores[index];
            final fornecedorItemList = FornecedorItemList.fromFornecedor(fornecedor);
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
                          backgroundImage: fornecedorItemList.image,
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
                              fornecedorItemList.title,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${fornecedorItemList.categoria} - ${fornecedorItemList.distancia} KM',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${fornecedorItemList.tempoEntrega} - ${fornecedorItemList.tempoEntrega + 10} min (${fornecedorItemList.frete > 0 ? 'R\$ ${fornecedorItemList.frete.toStringAsFixed(2)}' : 'Grátis'})',
                              style: const TextStyle(
                                fontSize: 12,
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
                          Icons.arrow_forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                fornecedorItemList.event(context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              color: Colors.black26,
            );
          },
          itemCount: fornecedores.length,
        );
      },
    );
  }
}
