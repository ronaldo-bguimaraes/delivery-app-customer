import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_anon.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';

abstract class IRepositoryAuth<T extends IEntity, U extends Usuario> extends IRepositoryAnon<T, U> {
  abstract final IServiceAuth<U> auth;
}
