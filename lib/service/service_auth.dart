import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';

class ServiceAuth<T extends Usuario, U extends Usuario> implements IServiceAuth<T> {
  T? _usuario;

  final IRepositoryUsuarioAnon<T, U> repositoryUsuario;

  ServiceAuth(this.repositoryUsuario);

  @override
  T? get currentUser {
    return _usuario;
  }

  @override
  String? get currentToken {
    return _usuario?.token;
  }

  T _updateUsuario(T usuario) {
    _usuario = usuario;
    return usuario;
  }

  @override
  Future<T> signIn(T usuario) async {
    final user = await repositoryUsuario.signIn(usuario);
    return _updateUsuario(user);
  }

  @override
  Future<T> signUp(T usuario) async {
    final user = await repositoryUsuario.signUp(usuario);
    return await signIn(user);
  }
}
