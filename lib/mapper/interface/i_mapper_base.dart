import 'package:delivery_app_customer/dto/inteface/i_dto.dart';

abstract class IMapper<T extends IDto> {
  Map<String, dynamic> toMap(T dto);
  T fromMap(Map<String, dynamic> map);
}
