import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryClienteAuth<T extends Cliente, U extends Usuario> extends IRepositoryAuth<T, U> {
  Future<T?> getByUsuario(U usuario);
}
