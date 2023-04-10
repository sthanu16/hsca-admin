// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_other_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOtherRequestModel _$AddOtherRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddOtherRequestModel(
      houseId: json['houseId'] as String?,
      basement: json['basement'] as String?,
      finished: json['finished'] as String?,
      garage: json['garage'] as String?,
    );

Map<String, dynamic> _$AddOtherRequestModelToJson(
        AddOtherRequestModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'basement': instance.basement,
      'finished': instance.finished,
      'garage': instance.garage,
    };
