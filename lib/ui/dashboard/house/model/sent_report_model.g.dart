// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentReportModel _$SentReportModelFromJson(Map<String, dynamic> json) =>
    SentReportModel(
      status: json['status'] as bool?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SentReportModelToJson(SentReportModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
