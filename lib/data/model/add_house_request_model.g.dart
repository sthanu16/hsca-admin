// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_house_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddHouseRequestModel _$AddHouseRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddHouseRequestModel(
      address: json['address'] as String?,
      housePrice: json['housePrice'] as String?,
      bedrooms: json['bedrooms'] as num?,
      bathrooms: json['bathrooms'] as num?,
      annualTax: json['annualTax'] as String?,
      SQfeet: json['SQfeet'] as String?,
      neighborhood: json['neighborhood'] as String?,
      builtYear: json['builtYear'] as num?,
    );

Map<String, dynamic> _$AddHouseRequestModelToJson(
        AddHouseRequestModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'housePrice': instance.housePrice,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'annualTax': instance.annualTax,
      'SQfeet': instance.SQfeet,
      'neighborhood': instance.neighborhood,
      'builtYear': instance.builtYear,
    };
