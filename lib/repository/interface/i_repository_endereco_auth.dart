import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryEnderecoAuth<T extends Endereco, U extends Usuario> extends IRepositoryAuth<T, U> {
  Future<List<T>> getByUsuario(U usuario);
}
