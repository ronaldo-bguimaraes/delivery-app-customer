import 'package:delivery_app_customer/dto/inteface/i_entity.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';

abstract class IRepositoryAnon<T extends IEntity, U extends Usuario> {
  abstract final IConfig config;
  abstract final IMapper<T> mapper;
  abstract final String subPath;

  Future<T> save(T entity);
  Future<List<T>> getAll();
  Future<void> remove(T entity);
  Future<T?> getById(int? id);
}
