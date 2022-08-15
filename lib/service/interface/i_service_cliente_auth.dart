import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/service/interface/i_service_entity_auth.dart';

abstract class IServiceClienteAuth<T extends Cliente, U extends Usuario> extends IServiceEntityAuth<T, U> {
  Future<T?> getByUsuario(U usuario);
}
