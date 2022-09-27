import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/venda.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_venda_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_venda_auth.dart';
import 'package:delivery_app_customer/service/service_entity_auth.dart';

class ServiceVendaAuth<T extends Venda, U extends Usuario> extends ServiceEntityAuth<T, U> implements IServiceVendaAuth<T, U> {
  IRepositoryVendaAuth<T, U> repositoryVenda;

  ServiceVendaAuth(this.repositoryVenda) : super(repositoryVenda);
}
