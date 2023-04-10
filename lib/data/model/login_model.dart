import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  bool? status;
  DataBean? data;
  String? token;
  String? message;

  LoginModel({this.status, this.data, this.token, this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class DataBean {
  String? name;
  String? email;

  DataBean({this.name, this.email});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

