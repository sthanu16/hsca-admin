import 'package:json_annotation/json_annotation.dart';

part 'delete_user_model.g.dart';

@JsonSerializable()
class DeleteUserModel {
  bool? status;
  dynamic data;
  String? message;

  DeleteUserModel({this.status, this.data, this.message});

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) => _$DeleteUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserModelToJson(this);
}

