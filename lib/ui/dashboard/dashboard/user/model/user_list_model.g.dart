// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListModel _$UserListModelFromJson(Map<String, dynamic> json) =>
    UserListModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: json['totalPage'],
      totalLength: json['totalLength'] as num?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserListModelToJson(UserListModel instance) =>
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
      created_at: json['created_at'] as String?,
      homes: json['homes'] as num?,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'realtor_id': instance.realtor_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'created_at': instance.created_at,
      'homes': instance.homes,
    };
