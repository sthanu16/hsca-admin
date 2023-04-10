import 'package:json_annotation/json_annotation.dart';

part 'user_list_model.g.dart';

@JsonSerializable()
class UserListModel {
  bool? status;
  List<DataBean>? data;
  dynamic totalPage;
  num? totalLength;
  String? message;

  UserListModel({this.status, this.data, this.totalPage, this.totalLength, this.message});

  factory UserListModel.fromJson(Map<String, dynamic> json) => _$UserListModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserListModelToJson(this);
}

@JsonSerializable()
class DataBean {
  num? id;
  dynamic realtor_id;
  String? first_name;
  String? last_name;
  String? created_at;
  num? homes;

  DataBean({this.id, this.realtor_id, this.first_name, this.last_name, this.created_at, this.homes});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

