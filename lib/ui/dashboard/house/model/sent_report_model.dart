import 'package:json_annotation/json_annotation.dart';

part 'sent_report_model.g.dart';

@JsonSerializable()
class SentReportModel {
  bool? status;
  dynamic data;
  String? message;

  SentReportModel({this.status, this.data, this.message});

  factory SentReportModel.fromJson(Map<String, dynamic> json) => _$SentReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$SentReportModelToJson(this);
}

