// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      id: json['id'] as num?,
      realtor_id: json['realtor_id'],
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      age: json['age'] as String?,
      street_address: json['street_address'] as String?,
      street_address2: json['street_address2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipcode: json['zipcode'] as String?,
      country: json['country'] as String?,
      cell_phone: json['cell_phone'] as String?,
      home_phone: json['home_phone'] as String?,
      min_price: json['min_price'] as String?,
      max_price: json['max_price'] as String?,
      building_type: json['building_type'] as String?,
      device_id: json['device_id'] as String?,
      device_type: json['device_type'] as String?,
      created_at: json['created_at'] as String?,
      deleted_at: json['deleted_at'],
      realtor_first_name: json['realtor_first_name'],
      realtor_last_name: json['realtor_last_name'],
      rating: json['rating'] as String?,
      houseData: (json['houseData'] as List<dynamic>?)
          ?.map((e) => HouseDataBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'realtor_id': instance.realtor_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'age': instance.age,
      'street_address': instance.street_address,
      'street_address2': instance.street_address2,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'country': instance.country,
      'cell_phone': instance.cell_phone,
      'home_phone': instance.home_phone,
      'min_price': instance.min_price,
      'max_price': instance.max_price,
      'building_type': instance.building_type,
      'device_id': instance.device_id,
      'device_type': instance.device_type,
      'created_at': instance.created_at,
      'deleted_at': instance.deleted_at,
      'realtor_first_name': instance.realtor_first_name,
      'realtor_last_name': instance.realtor_last_name,
      'rating': instance.rating,
      'houseData': instance.houseData,
    };

HouseDataBean _$HouseDataBeanFromJson(Map<String, dynamic> json) =>
    HouseDataBean(
      id: json['id'] as num?,
      rating: json['rating'] as num?,
      house_id: json['house_id'] as String?,
      address: json['address'] as String?,
      realtor_id: json['realtor_id'] as String?,
      created_at: json['created_at'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
    );

Map<String, dynamic> _$HouseDataBeanToJson(HouseDataBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'house_id': instance.house_id,
      'address': instance.address,
      'realtor_id': instance.realtor_id,
      'created_at': instance.created_at,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };
