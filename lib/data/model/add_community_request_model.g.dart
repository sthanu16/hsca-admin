// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_community_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommunityRequestModel _$AddCommunityRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddCommunityRequestModel(
      houseId: json['houseId'] as String?,
      schools: json['schools'] as String?,
      shopping: json['shopping'] as String?,
      distanceToAirport: json['distanceToAirport'] as String?,
      distanceToGo: json['distanceToGo'] as String?,
      publicTransport: json['publicTransport'] as String?,
    );

Map<String, dynamic> _$AddCommunityRequestModelToJson(
        AddCommunityRequestModel instance) =>
    <String, dynamic>{
      'houseId': instance.houseId,
      'schools': instance.schools,
      'shopping': instance.shopping,
      'distanceToAirport': instance.distanceToAirport,
      'distanceToGo': instance.distanceToGo,
      'publicTransport': instance.publicTransport,
    };
