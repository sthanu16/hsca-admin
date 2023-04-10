// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_realtor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRealtorModel _$UpdateRealtorModelFromJson(Map<String, dynamic> json) =>
    UpdateRealtorModel(
      realtorId: json['realtorId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      streetAddress: json['streetAddress'] as String?,
      streetAddress2: json['streetAddress2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipcode: json['zipcode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$UpdateRealtorModelToJson(UpdateRealtorModel instance) =>
    <String, dynamic>{
      'realtorId': instance.realtorId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'streetAddress': instance.streetAddress,
      'streetAddress2': instance.streetAddress2,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'country': instance.country,
    };
