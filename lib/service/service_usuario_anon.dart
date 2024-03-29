import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_customer/service/interface/i_service_usuario_anon.dart';
import 'package:delivery_app_customer/service/service_entity_anon.dart';

class ServiceUsuarioAnon<T extends Usuario, U extends Usuario> extends ServiceEntityAnon<T, U> implements IServiceUsuarioAnon<T, U> {
  IRepositoryUsuarioAnon<T, U> repositoryUsuario;

  ServiceUsuarioAnon(this.repositoryUsuario) : super(repositoryUsuario);
}
