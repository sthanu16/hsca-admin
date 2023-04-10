// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDashboardModel _$GetDashboardModelFromJson(Map<String, dynamic> json) =>
    GetDashboardModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      userRows: json['userRows'] == null
          ? null
          : UserRowsBean.fromJson(json['userRows'] as Map<String, dynamic>),
      totalHouse: json['totalHouse'] as num?,
      totalRealtor: json['totalRealtor'] as num?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetDashboardModelToJson(GetDashboardModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'userRows': instance.userRows,
      'totalHouse': instance.totalHouse,
      'totalRealtor': instance.totalRealtor,
      'message': instance.message,
    };

UserRowsBean _$UserRowsBeanFromJson(Map<String, dynamic> json) => UserRowsBean(
      id: json['id'] as num?,
      totalUsers: json['totalUsers'] as num?,
      minPriceAvg: json['minPriceAvg'] as num?,
      maxPriceAvg: json['maxPriceAvg'] as num?,
    );

Map<String, dynamic> _$UserRowsBeanToJson(UserRowsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalUsers': instance.totalUsers,
      'minPriceAvg': instance.minPriceAvg,
      'maxPriceAvg': instance.maxPriceAvg,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      id: json['id'] as num?,
      realtor_id: json['realtor_id'],
      totalHomes: json['totalHomes'] as num?,
      registration_number: json['registration_number'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'realtor_id': instance.realtor_id,
      'totalHomes': instance.totalHomes,
      'registration_number': instance.registration_number,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'created_at': instance.created_at,
    };
