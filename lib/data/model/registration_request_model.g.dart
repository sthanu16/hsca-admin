// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequestModel _$RegistrationRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegistrationRequestModel(
      realtorId: json['realtorId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as num?,
      email: json['email'] as String?,
      streetAddress: json['streetAddress'] as String?,
      streetAddress2: json['streetAddress2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipcode: json['zipcode'] as String?,
      country: json['country'] as String?,
      cellPhone: json['cellPhone'] as String?,
      homePhone: json['homePhone'] as String?,
      minPrice: json['minPrice'] as num?,
      maxPrice: json['maxPrice'] as num?,
      buildingType: json['buildingType'] as String?,
      deviceId: json['deviceId'] as String?,
      deviceType: json['deviceType'] as String?,
    );

Map<String, dynamic> _$RegistrationRequestModelToJson(
        RegistrationRequestModel instance) =>
    <String, dynamic>{
      'realtorId': instance.realtorId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'email': instance.email,
      'streetAddress': instance.streetAddress,
      'streetAddress2': instance.streetAddress2,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'country': instance.country,
      'cellPhone': instance.cellPhone,
      'homePhone': instance.homePhone,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'buildingType': instance.buildingType,
      'deviceId': instance.deviceId,
      'deviceType': instance.deviceType,
    };
