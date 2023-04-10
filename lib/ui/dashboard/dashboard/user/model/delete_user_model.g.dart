// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserModel _$DeleteUserModelFromJson(Map<String, dynamic> json) =>
    DeleteUserModel(
      status: json['status'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteUserModelToJson(DeleteUserModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
