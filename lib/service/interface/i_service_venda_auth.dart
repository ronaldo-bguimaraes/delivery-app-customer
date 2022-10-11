import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/service/interface/i_service_entity_auth.dart';

abstract class IServiceVendaAuth<T extends Venda, U extends Usuario> extends IServiceEntityAuth<T, U> {}
