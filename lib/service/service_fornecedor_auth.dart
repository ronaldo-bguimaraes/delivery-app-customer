import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_fornecedor_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_fornecedor_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceFornecedorAuth<T extends Fornecedor, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceFornecedorAuth<T, U> {
  IRepositoryFornecedorAuth<T, U> repositoryFornecedor;

  ServiceFornecedorAuth(this.repositoryFornecedor) : super(repositoryFornecedor);
}
