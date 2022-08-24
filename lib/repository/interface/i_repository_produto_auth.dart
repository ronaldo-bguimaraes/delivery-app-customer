import 'package:delivery_app_customer/dto/produto.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryProdutoAuth<T extends Produto, U extends Usuario> extends IRepositoryAuth<T, U> {}
