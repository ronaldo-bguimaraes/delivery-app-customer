import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/service/interface/i_service_entity_auth.dart';

abstract class IServiceFornecedorAuth<T extends Fornecedor, U extends Usuario> extends IServiceEntityAuth<T, U> {}
