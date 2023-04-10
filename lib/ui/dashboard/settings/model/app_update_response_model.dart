import 'package:json_annotation/json_annotation.dart';

part 'app_update_response_model.g.dart';

@JsonSerializable()
class AppUpdateResponseModel {
  bool? status;
  DataBean? data;
  String? message;

  AppUpdateResponseModel({this.status, this.data, this.message});

  factory AppUpdateResponseModel.fromJson(Map<String, dynamic> json) => _$AppUpdateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppUpdateResponseModelToJson(this);
}

@JsonSerializable()
class DataBean {
  AppUpdateBean? appUpdate;

  DataBean({this.appUpdate});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class AppUpdateBean {
  IosBean? ios;
  AndroidBean? android;

  AppUpdateBean({this.ios, this.android});

  factory AppUpdateBean.fromJson(Map<String, dynamic> json) => _$AppUpdateBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AppUpdateBeanToJson(this);
}

@JsonSerializable()
class AndroidBean {
  String? version;
  num? versionCode;
  num? forceUpdate;
  String? description;
  String? packageName;

  AndroidBean({this.version, this.versionCode, this.forceUpdate, this.description,this.packageName});

  factory AndroidBean.fromJson(Map<String, dynamic> json) => _$AndroidBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AndroidBeanToJson(this);
}

@JsonSerializable()
class IosBean {
  String? version;
  num? versionCode;
  num? forceUpdate;
  String? description;
  String? packageName;
  IosBean({this.version, this.versionCode, this.forceUpdate, this.description,this.packageName});

  factory IosBean.fromJson(Map<String, dynamic> json) => _$IosBeanFromJson(json);

  Map<String, dynamic> toJson() => _$IosBeanToJson(this);
}