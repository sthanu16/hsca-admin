// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_kitchen_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddKitchenRequestModel _$AddKitchenRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddKitchenRequestModel(
      houseId: json['houseId'] as String?,
      cabinets: json['cabinets'] as String?,
      flooring: json['flooring'] as String?,
      microOven: json['microOven'] as String?,
      backSplash: json['backSplash'] as String?,
      island: json['island'] as String?,
    );

Map<String, dynamic> _$AddKitchenRequestModelToJson(
        AddKitchenRequestModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'cabinets': instance.cabinets,
      'flooring': instance.flooring,
      'microOven': instance.microOven,
      'backSplash': instance.backSplash,
      'island': instance.island,
    };
