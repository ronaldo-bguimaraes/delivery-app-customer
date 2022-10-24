import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryVendaAuth<T extends Venda, U extends Usuario, V extends Cliente> extends IRepositoryAuth<T, U> {
  Future<List<T>> getByCliente(V cliente);
}
