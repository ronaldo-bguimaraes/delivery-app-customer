import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_endereco_auth.dart';
import 'package:delivery_app_customer/repository/repository_auth.dart';
import 'package:delivery_app_customer/service/interface/i_service_auth.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';

class RepositoryEnderecoAuth<T extends Endereco, U extends Usuario> extends RepositoryAuth<T, U> implements IRepositoryEnderecoAuth<T, U> {
  @override
  IConfig config;

  @override
  IServiceAuth<U> auth;

  @override
  IMapper<T> mapper;

  @override
  String get subPath => 'enderecos';

  RepositoryEnderecoAuth(this.config, this.auth, this.mapper);
}
