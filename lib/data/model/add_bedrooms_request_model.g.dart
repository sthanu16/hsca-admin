// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bedrooms_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBedroomsRequestModel _$AddBedroomsRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddBedroomsRequestModel(
      houseId: json['houseId'] as String?,
      bedrooms: (json['bedrooms'] as List<dynamic>?)
          ?.map((e) => BedroomsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddBedroomsRequestModelToJson(
        AddBedroomsRequestModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'bedrooms': instance.bedrooms,
    };

BedroomsBean _$BedroomsBeanFromJson(Map<String, dynamic> json) => BedroomsBean(
      roomType: json['roomType'] as String?,
      size: json['size'] as String?,
      carpetFloor: json['carpetFloor'] as String?,
      woodFloor: json['woodFloor'] as String?,
      closetWN: json['closetWN'] as String?,
      bathroom: json['bathroom'] as String?,
      standing: json['standing'] as String?,
      tub: json['tub'] as String?,
    );

Map<String, dynamic> _$BedroomsBeanToJson(BedroomsBean instance) =>
    <String, dynamic>{
      'roomType': instance.roomType,
      'size': instance.size,
      'carpetFloor': instance.carpetFloor,
      'woodFloor': instance.woodFloor,
      'closetWN': instance.closetWN,
      'bathroom': instance.bathroom,
      'standing': instance.standing,
      'tub': instance.tub,
    };
