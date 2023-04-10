// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      status: json['status'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChangePasswordModelToJson(
        ChangePasswordModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
