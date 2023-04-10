import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  bool? status;
  dynamic data;
  String? message;

  ChangePasswordModel({this.status, this.data, this.message});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}

