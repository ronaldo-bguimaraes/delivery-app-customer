import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/service/interface/i_service_entity_auth.dart';

abstract class IServiceEnderecoAuth<T extends Endereco, U extends Usuario> extends IServiceEntityAuth<T, U> {}
