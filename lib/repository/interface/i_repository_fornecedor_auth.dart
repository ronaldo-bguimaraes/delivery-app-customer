import 'package:delivery_app_customer/dto/fornecedor.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryFornecedorAuth<T extends Fornecedor, U extends Usuario> extends IRepositoryAuth<T, U> {}
