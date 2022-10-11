import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/dto/item_produto.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_auth.dart';

abstract class IRepositoryItemProdutoAuth<T extends ItemProduto, U extends Usuario> extends IRepositoryAuth<T, U> {}
