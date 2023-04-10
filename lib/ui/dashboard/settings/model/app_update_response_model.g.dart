// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUpdateResponseModel _$AppUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    AppUpdateResponseModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppUpdateResponseModelToJson(
        AppUpdateResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      appUpdate: json['appUpdate'] == null
          ? null
          : AppUpdateBean.fromJson(json['appUpdate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'appUpdate': instance.appUpdate,
    };

AppUpdateBean _$AppUpdateBeanFromJson(Map<String, dynamic> json) =>
    AppUpdateBean(
      ios: json['ios'] == null
          ? null
          : IosBean.fromJson(json['ios'] as Map<String, dynamic>),
      android: json['android'] == null
          ? null
          : AndroidBean.fromJson(json['android'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppUpdateBeanToJson(AppUpdateBean instance) =>
    <String, dynamic>{
      'ios': instance.ios,
      'android': instance.android,
    };

AndroidBean _$AndroidBeanFromJson(Map<String, dynamic> json) => AndroidBean(
      version: json['version'] as String?,
      versionCode: json['versionCode'] as num?,
      forceUpdate: json['forceUpdate'] as num?,
      description: json['description'] as String?,
      packageName: json['packageName'] as String?,
    );

Map<String, dynamic> _$AndroidBeanToJson(AndroidBean instance) =>
    <String, dynamic>{
      'version': instance.version,
      'versionCode': instance.versionCode,
      'forceUpdate': instance.forceUpdate,
      'description': instance.description,
      'packageName': instance.packageName,
    };

IosBean _$IosBeanFromJson(Map<String, dynamic> json) => IosBean(
      version: json['version'] as String?,
      versionCode: json['versionCode'] as num?,
      forceUpdate: json['forceUpdate'] as num?,
      description: json['description'] as String?,
      packageName: json['packageName'] as String?,
    );

Map<String, dynamic> _$IosBeanToJson(IosBean instance) => <String, dynamic>{
      'version': instance.version,
      'versionCode': instance.versionCode,
      'forceUpdate': instance.forceUpdate,
      'description': instance.description,
      'packageName': instance.packageName,
    };
