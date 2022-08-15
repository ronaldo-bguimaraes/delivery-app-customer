import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryUsuarioAuth<T extends Usuario, U extends Usuario> extends IRepositoryAuth<T, U> {
  Future<T> signIn(T usuario);
}
