import 'package:delivery_app_customer/screens/inicio/product_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductList extends StatefulWidget {
  static const String routeName = '/product_list';

  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<ProductItemList> mylist = [
    ProductItemList(
      descricao: 'Baguncinha',
      valor: 15,
      categoria: 'Lanches',
      fornecedor: 'Bellatos',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha',
      disponivel: true,
      image: AssetImage('./assets/images/baguncinha.png'),
      event: (context){

      },
    ),
    ProductItemList(
      descricao: 'X-Tudo',
      valor: 25,
      categoria: 'Lanches',
      fornecedor: 'CJ Lanches',
      ingredientes: 'Pão, hamburguer, alface, tomate, ovo, milho, salsicha, bacon, cheddar',
      disponivel: true,
      image: AssetImage('./assets/images/x-tudo.png'),
      event: (context){

      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index){
          var item = mylist[index];

          return Row(
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
                    SizedBox(height: 10,),
                    Text("Preço: R\$" + item.valor.toString())
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: Container(
                  child: Image(image: item.image),
                ),
              )
            ],
          );
        },
        padding: EdgeInsets.all(16.0),
        separatorBuilder: (_, __) => Divider(), 
        itemCount: mylist.length
      ),
    );
  }
}

class Expandad {
}