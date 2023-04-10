// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : DataBean.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'token': instance.token,
      'message': instance.message,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
