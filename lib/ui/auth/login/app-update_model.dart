import 'package:json_annotation/json_annotation.dart';

part 'app-update_model.g.dart';

@JsonSerializable()
class AppupdateModel {
  bool? status;
  dynamic data;
  String? message;

  AppupdateModel({this.status, this.data, this.message});

  factory AppupdateModel.fromJson(Map<String, dynamic> json) => _$AppupdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppupdateModelToJson(this);
}

