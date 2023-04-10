// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_appliances_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAppliancesRequestModel _$AddAppliancesRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddAppliancesRequestModel(
      houseId: json['houseId'] as String?,
      regridgerator: json['regridgerator'] as String?,
      dishWasher: json['dishWasher'] as String?,
      washer: json['washer'] as String?,
      ac: json['ac'] as String?,
      furnace: json['furnace'] as String?,
    );

Map<String, dynamic> _$AddAppliancesRequestModelToJson(
        AddAppliancesRequestModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'regridgerator': instance.regridgerator,
      'dishWasher': instance.dishWasher,
      'washer': instance.washer,
      'ac': instance.ac,
      'furnace': instance.furnace,
    };
