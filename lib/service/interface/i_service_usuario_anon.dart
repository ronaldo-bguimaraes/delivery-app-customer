import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/service/interface/i_service_entity_anon.dart';

abstract class IServiceUsuarioAnon<T extends Usuario, U extends Usuario> extends IServiceEntityAnon<T, U> {}
