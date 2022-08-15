import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_endereco_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_endereco_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceEnderecoAuth<T extends Endereco, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceEnderecoAuth<T, U> {
  IRepositoryEnderecoAuth<T, U> repositoryEndereco;

  ServiceEnderecoAuth(this.repositoryEndereco) : super(repositoryEndereco);
}
