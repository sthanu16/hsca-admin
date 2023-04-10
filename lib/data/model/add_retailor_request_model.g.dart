// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_retailor_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRealtorRequestModel _$AddRealtorRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddRealtorRequestModel(
      realtorId: json['realtorId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      fullAddress: json['fullAddress'] as String?,
      city: json['city'] as String?,
      pinCode: json['pinCode'] as String?,
      state: json['state'] as String?,
      telephone: json['telephone'] as String?,
      mobile: json['mobile'] as String?,
      priceMin: json['priceMin'] as String?,
      priceMax: json['priceMax'] as String?,
      building: json['building'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AddRealtorRequestModelToJson(
        AddRealtorRequestModel instance) =>
    <String, dynamic>{
      'realtorId': instance.realtorId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'email': instance.email,
      'address': instance.address,
      'fullAddress': instance.fullAddress,
      'city': instance.city,
      'pinCode': instance.pinCode,
      'state': instance.state,
      'telephone': instance.telephone,
      'mobile': instance.mobile,
      'priceMin': instance.priceMin,
      'priceMax': instance.priceMax,
      'building': instance.building,
      'country': instance.country,
    };
