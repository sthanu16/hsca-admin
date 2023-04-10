// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_realtor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRealtorModel _$AddRealtorModelFromJson(Map<String, dynamic> json) =>
    AddRealtorModel(
      status: json['status'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddRealtorModelToJson(AddRealtorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
