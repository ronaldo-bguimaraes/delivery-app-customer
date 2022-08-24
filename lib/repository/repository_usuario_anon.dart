import 'dart:io';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/json/json_tool.dart';
import 'package:delivery_app_customer/mapper/interface/i_mapper_base.dart';
import 'package:delivery_app_customer/repository/interface/i_repository_usuario_anon.dart';
import 'package:delivery_app_customer/repository/repository_anon.dart';
import 'package:delivery_app_customer/config/interface/i_config.dart';
import 'package:http/http.dart' as http;

class RepositoryUsuarioAnon<T extends Usuario, U extends Usuario> extends RepositoryAnon<T, U> implements IRepositoryUsuarioAnon<T, U> {
  @override
  IConfig config;

  @override
  IMapper<T> mapper;

  @override
  String subPath = 'usuarios';

  RepositoryUsuarioAnon(this.config, this.mapper);

  @override
  Future<T> signUp(T entity) async {
    await http.post(
      Uri.parse('$fullPath'),
      body: JsonTool.encode(mapper.toMap(entity)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return entity;
  }

  @override
  Future<T> signIn(T usuario) async {
    final response = await http.post(
      Uri.parse('$fullPath/login'),
      body: JsonTool.encode(mapper.toMap(usuario)),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return mapper.fromMap(JsonTool.decode(response.body));
  }
}
