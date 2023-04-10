// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_realtor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRealtorModel _$DeleteRealtorModelFromJson(Map<String, dynamic> json) =>
    DeleteRealtorModel(
      status: json['status'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteRealtorModelToJson(DeleteRealtorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
