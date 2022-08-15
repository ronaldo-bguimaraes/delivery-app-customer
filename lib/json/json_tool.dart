import 'dart:convert';

class JsonTool {
  static encode(Map<String, dynamic> map) {
    final _map = Map.from(map);
    _map.removeWhere((key, value) => value == null);
    return jsonEncode(_map);
  }

  static decode(String json) {
    return jsonDecode(json);
  }
}
