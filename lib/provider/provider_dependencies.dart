import 'package:delivery_app_customer/mapper/interface/i_mapper_cliente.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_endereco.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_produto.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_usuario.dart';
import 'package:delivery_app_customer/mapper/mapper_cliente.dart';
import 'package:delivery_app_customer/mapper/mapper_endereco.dart';
import 'package:delivery_app_customer/mapper/mapper_produto.dart';
import 'package:delivery_app_customer/mapper/mapper_usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_cliente_auth.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_endereco_auth.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_produto_auth.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_usuario_auth.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_customer/repository/repository_cliente_auth.dart';
import 'package:delivery_app_customer/repository/repository_endereco_auth.dart';
import 'package:delivery_app_customer/repository/repository_produto_auth.dart';
import 'package:delivery_app_customer/repository/repository_usuario_auth.dart';
import 'package:delivery_app_customer/repository/repository_usuario_anon.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_cart.dart';
import 'package:delivery_app_customer/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';
import 'package:delivery_app_customer/service/interface/i_service_endereco_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_produto_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_usuario_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_usuario_anon.dart';
import 'package:delivery_app_customer/service/service_auth.dart';
import 'package:delivery_app_customer/service/service_cart.dart';
import 'package:delivery_app_customer/service/service_cliente_auth.dart';
import 'package:delivery_app_customer/config/config.dart';
import 'package:delivery_app_customer/service/service_endereco_auth.dart';
import 'package:delivery_app_customer/service/service_produto_auth.dart';
import 'package:delivery_app_customer/service/service_usuario_auth.dart';
import 'package:delivery_app_customer/service/service_usuario_anon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// provê em na ordem correta todas as dependencias nescessárias
class ProviderDependencies extends StatelessWidget {
  final Widget child;

  const ProviderDependencies({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IMapperCliente>(
          create: (ctx) => MapperCliente(),
          lazy: true,
        ),
        Provider<IMapperUsuario>(
          create: (ctx) => MapperUsuario(),
          lazy: true,
        ),
        Provider<IMapperEndereco>(
          create: (ctx) => MapperEndereco(),
          lazy: true,
        ),
        Provider<IMapperProduto>(
          create: (ctx) => MapperProduto(),
          lazy: true,
        ),
        Provider<IConfig>(
          create: (ctx) => Config(),
          lazy: true,
        ),
        Provider<IRepositoryUsuarioAnon>(
          create: (ctx) => RepositoryUsuarioAnon(
            ctx.read<IConfig>(),
            ctx.read<IMapperUsuario>(),
          ),
          lazy: true,
        ),
        Provider<IServiceAuth>(
          create: (ctx) => ServiceAuth(
            ctx.read<IRepositoryUsuarioAnon>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryUsuarioAuth>(
          create: (ctx) => RepositoryUsuarioAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperUsuario>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryClienteAuth>(
          create: (ctx) => RepositoryClienteAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperCliente>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryEnderecoAuth>(
          create: (ctx) => RepositoryEnderecoAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperEndereco>(),
          ),
          lazy: true,
        ),
        Provider<IRepositoryProdutoAuth>(
          create: (ctx) => RepositoryProdutoAuth(
            ctx.read<IConfig>(),
            ctx.read<IServiceAuth>(),
            ctx.read<IMapperProduto>(),
          ),
          lazy: true,
        ),
        Provider<IServiceUsuarioAnon>(
          create: (ctx) => ServiceUsuarioAnon(
            ctx.read<IRepositoryUsuarioAnon>(),
          ),
          lazy: true,
        ),
        Provider<IServiceUsuarioAuth>(
          create: (ctx) => ServiceUsuarioAuth(
            ctx.read<IRepositoryUsuarioAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceClienteAuth>(
          create: (ctx) => ServiceClienteAuth(
            ctx.read<IRepositoryClienteAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceEnderecoAuth>(
          create: (ctx) => ServiceEnderecoAuth(
            ctx.read<IRepositoryEnderecoAuth>(),
          ),
          lazy: true,
        ),
        Provider<IServiceProdutoAuth>(
          create: (ctx) => ServiceProdutoAuth(
            ctx.read<IRepositoryProdutoAuth>(),
          ),
          lazy: true,
        ),
        ChangeNotifierProvider<IServiceCart>(
          create: (ctx) => ServiceCart(),
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
