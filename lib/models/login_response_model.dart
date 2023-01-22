import 'dart:convert';

import 'data_request_model.dart';

LoginResponse loginResponseJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.key,
  });
  //late final bool success;
  //late final Data data;
  late final String key;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    //success = json['success'];
    //data = Data.fromJson(json['data']);
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    //_data['success'] = success;
    //_data['data'] = data.toJson();
    _data['key'] = key;
    return _data;
  }
}
