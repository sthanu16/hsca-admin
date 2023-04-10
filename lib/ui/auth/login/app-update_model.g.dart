// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app-update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppupdateModel _$AppupdateModelFromJson(Map<String, dynamic> json) =>
    AppupdateModel(
      status: json['status'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppupdateModelToJson(AppupdateModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
