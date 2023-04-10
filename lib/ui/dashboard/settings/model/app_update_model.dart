import 'package:json_annotation/json_annotation.dart';

part 'app_update_model.g.dart';

@JsonSerializable()
class AppUpdateModel {
  String? androidVersion;
  String? iosVersion;
  String? androidPackageName;
  String? iosPackageName;
  num? androidCode;
  num? iosCode;
  num? forceAndroidUpdate;
  num? forceIosUpdate;
  String? androidDescription;
  String? iosDescription;

  AppUpdateModel({this.androidVersion, this.iosVersion, this.iosPackageName, this.androidPackageName, this.androidCode, this.iosCode, this.forceAndroidUpdate, this.forceIosUpdate, this.androidDescription, this.iosDescription});

  factory AppUpdateModel.fromJson(Map<String, dynamic> json) => _$AppUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppUpdateModelToJson(this);
}



