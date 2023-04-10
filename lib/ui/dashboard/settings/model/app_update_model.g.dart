// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUpdateModel _$AppUpdateModelFromJson(Map<String, dynamic> json) =>
    AppUpdateModel(
      androidVersion: json['androidVersion'] as String?,
      iosVersion: json['iosVersion'] as String?,
      iosPackageName: json['iosPackageName'] as String?,
      androidPackageName: json['androidPackageName'] as String?,
      androidCode: json['androidCode'] as num?,
      iosCode: json['iosCode'] as num?,
      forceAndroidUpdate: json['forceAndroidUpdate'] as num?,
      forceIosUpdate: json['forceIosUpdate'] as num?,
      androidDescription: json['androidDescription'] as String?,
      iosDescription: json['iosDescription'] as String?,
    );

Map<String, dynamic> _$AppUpdateModelToJson(AppUpdateModel instance) =>
    <String, dynamic>{
      'androidVersion': instance.androidVersion,
      'iosVersion': instance.iosVersion,
      'androidPackageName': instance.androidPackageName,
      'iosPackageName': instance.iosPackageName,
      'androidCode': instance.androidCode,
      'iosCode': instance.iosCode,
      'forceAndroidUpdate': instance.forceAndroidUpdate,
      'forceIosUpdate': instance.forceIosUpdate,
      'androidDescription': instance.androidDescription,
      'iosDescription': instance.iosDescription,
    };
