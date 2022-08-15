import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/screens/perfil/endereco_add.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnderecoList extends StatefulWidget {
  final Usuario usuario;
  final List<Endereco> enderecos;

  const EnderecoList({Key? key, required this.usuario, required this.enderecos}) : super(key: key);

  @override
  State<EnderecoList> createState() => _EnderecoListState();
}

class _EnderecoListState extends State<EnderecoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Usuario? usuario = context.read<IServiceAuth>().currentUser;
          if (usuario == null) {
            throw Exception('Usuário não está logado');
          }
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return EnderecoAdd(usuario: usuario);
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
