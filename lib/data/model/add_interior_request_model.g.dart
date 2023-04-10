// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_interior_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddInteriorRequestModel _$AddInteriorRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddInteriorRequestModel(
      houseId: json['houseId'] as String?,
      painting: json['painting'] as String?,
      ceiling: json['ceiling'] as String?,
      windows: json['windows'] as String?,
      flooring: json['flooring'] as String?,
      stairs: json['stairs'] as String?,
      livingRoom: json['livingRoom'] as String?,
      size: json['size'] as String?,
      carpet: json['carpet'] as String?,
      wood: json['wood'] as String?,
      familyRoom: json['familyRoom'] as String?,
      dinningRoom: json['dinningRoom'] as String?,
      powderRoom: json['powderRoom'] as String?,
    );

Map<String, dynamic> _$AddInteriorRequestModelToJson(
        AddInteriorRequestModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'painting': instance.painting,
      'ceiling': instance.ceiling,
      'windows': instance.windows,
      'flooring': instance.flooring,
      'stairs': instance.stairs,
      'livingRoom': instance.livingRoom,
      'size': instance.size,
      'carpet': instance.carpet,
      'wood': instance.wood,
      'familyRoom': instance.familyRoom,
      'dinningRoom': instance.dinningRoom,
      'powderRoom': instance.powderRoom,
    };
