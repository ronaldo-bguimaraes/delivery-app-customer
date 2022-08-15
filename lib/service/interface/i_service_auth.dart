import 'package:delivery_app_customer/dto/usuario.dart';

abstract class IServiceAuth<T extends Usuario> {
  T? get currentUser;
  String? get currentToken;
  Future<T> signIn(T usuario);
  Future<T> signUp(T usuario);
}
