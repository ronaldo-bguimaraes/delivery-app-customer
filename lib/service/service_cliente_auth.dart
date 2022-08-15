import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_cliente_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_cliente_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceClienteAuth<T extends Cliente, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceClienteAuth<T, U> {
  IRepositoryClienteAuth<T, U> repositoryCliente;

  ServiceClienteAuth(this.repositoryCliente) : super(repositoryCliente);

  @override
  Future<T?> getByUsuario(U usuario) {
    return repositoryCliente.getByUsuario(usuario);
  }
}
