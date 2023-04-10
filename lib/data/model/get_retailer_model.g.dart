// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_retailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRetailerModel _$GetRetailerModelFromJson(Map<String, dynamic> json) =>
    GetRetailerModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: json['totalPage'],
      totalLength: json['totalLength'] as num?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetRetailerModelToJson(GetRetailerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'totalPage': instance.totalPage,
      'totalLength': instance.totalLength,
      'message': instance.message,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      id: json['id'] as num?,
      realtor_id: json['realtor_id'],
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      street_address: json['street_address'] as String?,
      street_address2: json['street_address2'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      created_at: json['created_at'] as String?,
      deleted_at: json['deleted_at'] as String?,
      buyerCount: json['buyerCount'],
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'realtor_id': instance.realtor_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'street_address': instance.street_address,
      'street_address2': instance.street_address2,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'state': instance.state,
      'country': instance.country,
      'created_at': instance.created_at,
      'deleted_at': instance.deleted_at,
      'buyerCount': instance.buyerCount,
    };
